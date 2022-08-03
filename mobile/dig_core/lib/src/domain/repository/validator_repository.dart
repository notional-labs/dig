import 'package:dig_core/src/domain/entity/staking/logo_response.dart';
import 'package:dig_core/src/domain/entity/staking/validator_response.dart';
import 'package:dig_core/src/domain/env/env.dart';

abstract class ValidatorRepository {
  ChainENV createChain(ChainENV chain);
  Future<ValidatorResponse> getValidators();
  Future<LogoResponse> getLogo(String identity);
}
