import 'package:dig_core/src/domain/entity/staking/logo_response.dart';
import 'package:dig_core/src/domain/entity/staking/validator_response.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/data/extension/extension.dart';
import 'package:injectable/injectable.dart';

abstract class ValidatorRemmoteDatasource {
  ChainENV createChain(ChainENV chain);
  Future<ValidatorResponse> getValidators();
  Future<LogoResponse> getLogo(String identity);
}

@Injectable(as: ValidatorRemmoteDatasource)
class ValidatorRemmoteDatasourceImplement
    implements ValidatorRemmoteDatasource {
  ChainENV? _chain;

  @override
  ChainENV createChain(ChainENV chain) {
    _chain ??= chain;
    return _chain!;
  }

  @override
  Future<ValidatorResponse> getValidators() {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');

    final restClient = _chain!.getRestClient();
    return restClient.getValidators();
  }

  @override
  Future<LogoResponse> getLogo(String identity) {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');

    final restClient = _chain!.getRestClient();
    return restClient.getValidatorLogo(identity: identity);
  }
}
