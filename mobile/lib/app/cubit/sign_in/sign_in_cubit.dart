import 'package:dig_mobile_app/app/cubit/sign_in/sign_in_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInPrimaryState());

  Future<dynamic> goToBackUpWalletEvent() =>
      navigatorKey.currentState!.pushNamed(DigPageName.backUpYourWallet);

  Future<dynamic> goToImportAccountEvent() =>
      navigatorKey.currentState!.pushNamed(DigPageName.importAccount);
}
