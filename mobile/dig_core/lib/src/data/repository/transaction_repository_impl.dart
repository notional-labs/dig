import 'dart:developer';
import 'package:alan/alan.dart' as alan;
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dig_core/src/domain/entity/send_token_request.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/repository/transaction_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:transaction_signing_gateway/mobile/no_op_transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/model/account_lookup_key.dart';
import 'package:transaction_signing_gateway/model/transaction_response.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';
import 'package:fixnum/fixnum.dart' as fixnum;

@Injectable(as: TransactionRepository)
class TransactionRepositoryImplement implements TransactionRepository {
  TransactionRepositoryImplement();

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
  Future<TransactionResponse?> sendToken(SendTokenRequest param) async {
    TransactionResponse? txnResponse;
    final message = bank.MsgSend.create()
      ..fromAddress = param.info.publicAddress
      ..toAddress = param.toAddress;
    message.amount.add(
      alan.Coin.create()
        ..denom = param.balance.denom
        ..amount = param.balance.amount,
    );

    final alan.Fee fee = alan.Fee(
        amount: [alan.Coin(denom: param.fee.denom, amount: param.fee.amount)],
        gasLimit: fixnum.Int64.fromInts(1, 2));

    final unsignedTransaction =
        UnsignedAlanTransaction(messages: [message], fee: fee);

    final accountLookupKey = AccountLookupKey(
      accountId: param.info.accountId,
      chainId: param.info.chainId,
      password: param.password,
    );

    final result = await createTransactionSigningGateway()
        .signTransaction(
          transaction: unsignedTransaction,
          accountLookupKey: accountLookupKey,
        )
        .mapError<dynamic>((error) => throw error)
        .flatMap(
          (signed) => createTransactionSigningGateway().broadcastTransaction(
            accountLookupKey: accountLookupKey,
            transaction: signed,
          ),
        );
    result.fold(
      (fail) => throw fail as Object,
      (hash) {
        log('New TX hash: $hash');
        txnResponse = hash;
      },
    );

    return txnResponse;
  }
}
