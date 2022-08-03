import 'package:dig_core/dig_core.dart';

abstract class SplashState {
  const SplashState();
}

class SplashUninitState extends SplashState {
  const SplashUninitState();
}

class SplashAuthencationState extends SplashState {
  const SplashAuthencationState();
}

class SplashunauthenticatedState extends SplashState {
  const SplashunauthenticatedState();
}

class SplashErrorState extends SplashState {
  final BaseDigException exception;
  const SplashErrorState({this.exception = const DigException()});
}
