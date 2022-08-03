import 'package:dig_core/src/data/definition/definition.dart';
import 'package:dig_core/src/data/exception/dig_exception_impl.dart';
import 'package:dig_core/src/domain/definition/definition.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transaction_signing_gateway/model/account_derivation_failure.dart';

class DigExceptionHandler implements BaseDigExceptionHandler {
  @override
  BaseDigException handler(any) {
    if (any is DioError) {
      return _handleDioError(any);
    }

    if (any is FirebaseAuthException) {
      return _handleFirebaseAuthError(any);
    }

    if (any is AccountDerivationFailure) {
      return _handleAccountDerivationFailure(any);
    }

    if (any is BaseDigException) {
      return any;
    }

    return DigException(message: any.toString());
  }

  BaseDigException _handleDioError(DioError any) {
    if (any.error is DigNetworkException) {
      return const DigNetworkException(message: DataErrorMessage.networkError);
    }
    if (any.error is BaseDigException) {
      return any.error;
    }

    return const DigServerException();
  }

  BaseDigException _handleFirebaseAuthError(FirebaseAuthException any) {
    return DigServerException(message: any.message ?? '');
  }

  BaseDigException _handleAccountDerivationFailure(
      AccountDerivationFailure any) {
    switch (any.type) {
      case AccountDerivationFailType.invalidMnemonic:
        return const DigException(message: DomainErrorMessage.invalidMnemonic);
      case AccountDerivationFailType.derivatorNotFound:
        return const DigException(message: DataErrorMessage.derivatorNotFound);
      default:
        return const DigException(message: DataErrorMessage.unknownError);
    }
  }
}
