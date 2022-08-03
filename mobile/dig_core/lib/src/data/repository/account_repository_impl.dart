import 'package:dig_core/src/data/datasource/remote/account_remote_datasource.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/entity/balance_resquest.dart';
import 'package:dig_core/src/domain/entity/balance_response.dart';
import 'package:dig_core/src/domain/repository/account_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AccountRepository)
class AccountRepositoryImplement implements AccountRepository {
  final AccountRemoteDatasource _datasource;
  AccountRepositoryImplement(this._datasource);

  @override
  ChainENV createChainENV(ChainENV chain) => _datasource.createChain(chain);

  @override
  Future<BalanceResponse> getBalances(BalanceRequest param) =>
      _datasource.getBalances(param);
}
