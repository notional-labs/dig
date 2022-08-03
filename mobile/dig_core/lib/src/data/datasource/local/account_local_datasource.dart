import 'package:dig_core/src/data/definition/definition.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AccountLocalDatasource {
  Future<String?> getLastSelectedAccountId();
  Future selectAccount(String accountId);
}

@Injectable(as: AccountLocalDatasource)
class AccountLocalDatasourceImplement implements AccountLocalDatasource {
  SharedPreferences? _prefs;

  Future<SharedPreferences> getSharedPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<String?> getLastSelectedAccountId() async {
    final accountId =
        (await getSharedPreferences()).getString(DigKey.accountId);
    return accountId;
  }

  @override
  Future selectAccount(String accountId) async =>
      (await getSharedPreferences()).setString(DigKey.accountId, accountId);
}
