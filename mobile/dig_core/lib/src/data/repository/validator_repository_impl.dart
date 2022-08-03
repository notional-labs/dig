import 'package:dig_core/src/data/datasource/remote/validator_remote_datasource.dart';
import 'package:dig_core/src/domain/entity/staking/logo_response.dart';
import 'package:dig_core/src/domain/entity/staking/validator_response.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/repository/validator_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ValidatorRepository)
class ValidatorRepositoryImplement implements ValidatorRepository {
  final ValidatorRemmoteDatasource _datasource;
  ValidatorRepositoryImplement(this._datasource);

  @override
  ChainENV createChain(ChainENV chain) => _datasource.createChain(chain);

  @override
  Future<ValidatorResponse> getValidators() => _datasource.getValidators();

  @override
  Future<LogoResponse> getLogo(String identity) =>
      _datasource.getLogo(identity);
}
