import 'package:dig_core/src/domain/entity/send_token_request.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/transaction_response.dart';

abstract class TransactionRepository {
  ChainENV createChainENV(ChainENV chain);
  TransactionSigningGateway createTransactionSigningGateway();
  Future<TransactionResponse?> sendToken(SendTokenRequest param);
}
