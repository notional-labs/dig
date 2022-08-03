import 'package:equatable/equatable.dart';

abstract class BaseDigException extends Equatable implements Exception {
  final String message;
  const BaseDigException({required this.message});
}

abstract class BaseDigExceptionHandler {
  BaseDigException handler(any);
}
