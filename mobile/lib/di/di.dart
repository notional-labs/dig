import 'package:dig_core/dig_core.dart' as core;
import 'package:dig_mobile_app/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final di = GetIt.asNewInstance()..allowReassignment = true;

@injectableInit
void initDI(core.ENV env) {
  $initGetIt(di);
  core.initDI(di, env);
}

void resetDi() {
  di.reset();
}
