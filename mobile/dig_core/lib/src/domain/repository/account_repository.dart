import 'package:dig_core/src/domain/entity/balance_response.dart';
import 'package:dig_core/src/domain/entity/balance_resquest.dart';
import 'package:dig_core/src/domain/env/env.dart';

abstract class AccountRepository {
  ChainENV createChainENV(ChainENV chain);
  Future<BalanceResponse> getBalances(BalanceRequest param);
}
