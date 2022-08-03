import 'package:dig_core/src/domain/entity/error_response.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';

class DigServerException extends BaseDigException {
  final int statusCode;
  final ErrorResponse errorResponse;
  const DigServerException(
      {this.statusCode = -1,
      String message = '',
      this.errorResponse = const ErrorResponse()})
      : super(message: message);

  BaseDigException copyWith({
    int? statusCode,
    String? message,
  }) {
    return DigServerException(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [statusCode, message];

  @override
  bool? get stringify => true;
}

class DigNetworkException extends BaseDigException {
  const DigNetworkException({String message = ''}) : super(message: message);

  @override
  List<Object?> get props => const [];

  @override
  bool? get stringify => true;
}

class DigException extends BaseDigException {
  final StackTrace? trace;
  const DigException({String message = '', this.trace})
      : super(message: message);

  @override
  List<Object?> get props => [message, trace];

  @override
  bool? get stringify => true;
}
