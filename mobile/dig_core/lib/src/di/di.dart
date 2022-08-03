import 'package:dig_core/src/data/definition/definition.dart';
import 'package:dig_core/src/data/network/coingecko_rest_client.dart';
import 'package:dig_core/src/data/network/intercepter/dig_intecepter.dart';
import 'package:dig_core/src/data/network/rest_client.dart';
import 'package:dig_core/src/di/di.config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dig_core/src/domain/env/env.dart';

late final GetIt digCoreDI;

@injectableInit
void initDI(GetIt _di, ENV env) {
  digCoreDI = _di;
  digCoreDI
    ..registerLazySingleton<ENV>(() => env)
    ..registerLazySingleton<DigIntercepter>(() => DigIntercepter())
    ..registerFactory<FlutterSecureStorage>(() => const FlutterSecureStorage());

  final Dio dio = Dio()
    ..options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      sendTimeout: 30000,
    );
  dio.interceptors.add(digCoreDI<DigIntercepter>());

  digCoreDI
    ..registerLazySingleton<Dio>(() => dio)

    /// Register [RestClient] for DigChain
    ..registerFactory<RestClient>(
        () => RestClient.from(digCoreDI<Dio>(), digCoreDI<ENV>().digChain),
        instanceName: GetItInstanceName.restClientDigChain)
    ..registerFactory<CoingeckoRestClient>(
        () => CoingeckoRestClient.from(digCoreDI<Dio>(), digCoreDI<ENV>()));

  /// Register [CoingeckoRestClient]

  /// TODO: Register [RestClient] for other chain here...
  ///      ....

  $initGetIt(digCoreDI);
}
