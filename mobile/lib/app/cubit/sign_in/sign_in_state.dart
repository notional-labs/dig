import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInPrimaryState extends SignInState {
  const SignInPrimaryState() : super();
}
