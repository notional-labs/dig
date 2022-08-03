import 'package:dig_core/src/data/extension/extension.dart';
import 'package:dig_core/src/domain/entity/balance_response.dart';
import 'package:dig_core/src/domain/entity/balance_resquest.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:injectable/injectable.dart';

abstract class AccountRemoteDatasource {
  ChainENV createChain(ChainENV chain);
  Future<BalanceResponse> getBalances(BalanceRequest param);
}

@Injectable(as: AccountRemoteDatasource)
class AccountRemoteDatasourceImplement implements AccountRemoteDatasource {
  ChainENV? _chain;

  @override
  ChainENV createChain(ChainENV chain) {
    _chain ??= chain;
    return _chain!;
  }

  @override
  Future<BalanceResponse> getBalances(BalanceRequest param) {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');
    final restClient = _chain!.getRestClient();
    return restClient.getBalances(
        address: param.address,
        nextPageKey: param.nextPageKey,
        limit: param.limit);
  }
}
