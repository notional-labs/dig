import 'package:mobx/mobx.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class WalletsStore {
  final TransactionSigningGateway _transactionSigningGateway;

  WalletsStore(this._transactionSigningGateway);

  final Observable<bool> areWalletsLoading = Observable(false);

  final Observable<CredentialsStorageFailure?> loadWalletsFailure = Observable(null);

  Observable<List<WalletPublicInfo>> wallets = Observable([]);

  Future<void> loadWallets() async {
    areWalletsLoading.value = true;
    (await _transactionSigningGateway.getWalletsList()).fold(
      (fail) => loadWalletsFailure.value = fail,
      (newWallets) => wallets.value = newWallets,
    );
    areWalletsLoading.value = false;
  }
}
