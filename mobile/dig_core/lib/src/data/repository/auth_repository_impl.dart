import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/data/datasource/local/account_local_datasource.dart';
import 'package:dig_core/src/data/datasource/local/pin_local_datasource.dart';
import 'package:dig_core/src/domain/entity/create_mnemonic.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:transaction_signing_gateway/alan/alan_account_derivation_info.dart';
import 'package:transaction_signing_gateway/mobile/no_op_transaction_summary_ui.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImplement extends AuthRepository {
  final PinLocalDatasource _pinLocalDatasource;
  final AccountLocalDatasource _accountLocalDatasource;
  AuthRepositoryImplement(
      this._pinLocalDatasource, this._accountLocalDatasource);
  ChainENV? _chain;
  TransactionSigningGateway? _transactionSigningGateway;

  @override
  ChainENV createChainENV(ChainENV chain) {
    _chain = chain;
    return _chain!;
  }

  @override
  TransactionSigningGateway createTransactionSigningGateway() {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChainENV` first');
    _transactionSigningGateway ??= TransactionSigningGateway(
      transactionSummaryUI: NoOpTransactionSummaryUI(),
      signers: [
        AlanTransactionSigner(_chain!.networkInfo),
      ],
      broadcasters: [
        AlanTransactionBroadcaster(_chain!.networkInfo),
      ],
      infoStorage: CosmosKeyInfoStorage(
        serializers: [AlanCredentialsSerializer()],
        secureDataStore: FlutterSecureStorageDataStore(),
        plainDataStore: SharedPrefsPlainDataStore(),
      ),
    );

    return _transactionSigningGateway!;
  }

  @override
  Future<String> createMnemonic(CreateMnemonic param) async {
    param.onMnemonicGenerationStarted?.call();
    return generateMnemonic(strength: param.strength);
  }

  @override
  Future<AccountPublicInfo> importAccount(ImportAccount param) async {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChainENV` first');
    final result = await createTransactionSigningGateway()
        .deriveAccount(
      accountDerivationInfo: AlanAccountDerivationInfo(
        accountAlias: param.importAccountFormData.name,
        networkInfo: _chain!.networkInfo,
        mnemonic: param.importAccountFormData.mnemonic,
        chainId: _chain!.chainId,
      ),
    )
        .mapError<dynamic>((fail) {
      return fail;
    }).flatMap(
      (credentials) {
        return createTransactionSigningGateway()
            .storeAccountCredentials(
          credentials: credentials,
          password: param.importAccountFormData.password,
        )
            .flatMap(
          (_) async {
            return createTransactionSigningGateway().updateAccountPublicInfo(
              info: credentials.publicInfo.copyWith(
                additionalData:
                    param.importAccountFormData.additionalData.toJsonString(),
              ),
            );
          },
        ).mapSuccess((_) {
          return credentials;
        });
      },
    );

    return result.fold(
      (fail) {
        logError(fail);
        throw fail;
      },
      (credentials) {
        return credentials.publicInfo;
      },
    );
  }

  @override
  Future<List<AccountPublicInfo>> getAccountList() {
    final result = createTransactionSigningGateway().getAccountsList();
    return result.asyncFold((fail) {
      logError(fail);
      throw fail;
    }, (success) => success);
  }

  @override
  Future createPin(String pin) => _pinLocalDatasource.createPin(pin);

  @override
  Future<bool> checkHasPin() => _pinLocalDatasource.checkHasPin();

  @override
  Future<bool> matchPin(String pin) => _pinLocalDatasource.matchPin(pin);

  @override
  Future changePin(String pin) => _pinLocalDatasource.changePin(pin);

  @override
  Future deletePin() => _pinLocalDatasource.deletePin();

  @override
  Future<String?> getLastSelectedAccountId() =>
      _accountLocalDatasource.getLastSelectedAccountId();

  @override
  Future selectAccount(String accountId) =>
      _accountLocalDatasource.selectAccount(accountId);

  @override
  Future removeAccount(AccountPublicInfo accountPublicInfo) =>
      createTransactionSigningGateway()
          .deleteAccountCredentials(publicInfo: accountPublicInfo);
}
