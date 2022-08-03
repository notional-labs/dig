import 'package:dig_core/src/data/definition/definition.dart';
import 'package:dig_core/src/data/network/env/dig_chain_impl.dart';
import 'package:dig_core/src/data/network/rest_client.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/di/di.dart';

extension ChainEnvExtension on ChainENV {
  RestClient getRestClient() {
    if (this is DigChainMainNet || this is DigChainTestNet) {
      return digCoreDI<RestClient>(
          instanceName: GetItInstanceName.restClientDigChain);
    }

    return digCoreDI<RestClient>(
        instanceName: GetItInstanceName.restClientDigChain);
  }
}
