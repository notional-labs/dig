import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/name_account_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class NameAccountState extends Equatable {
  final NameAccountViewmodel viewmodel;

  const NameAccountState({this.viewmodel = const NameAccountViewmodel()});

  @override
  List<Object?> get props => [viewmodel];
}

class NameAccountUninitState extends NameAccountState {
  const NameAccountUninitState(
      {NameAccountViewmodel viewmodel = const NameAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class NameAccountPrimaryState extends NameAccountState {
  const NameAccountPrimaryState(
      {NameAccountViewmodel viewmodel = const NameAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class NameAccountLoadingState extends NameAccountState {
  const NameAccountLoadingState(
      {NameAccountViewmodel viewmodel = const NameAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class NameAccountSuccessState extends NameAccountState {
  final AccountPublicInfo accountPublicInfo;

  const NameAccountSuccessState(
      {required this.accountPublicInfo,
      NameAccountViewmodel viewmodel = const NameAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class NameAccountErrorState extends NameAccountState {
  final BaseDigException exception;

  const NameAccountErrorState(
      {NameAccountViewmodel viewmodel = const NameAccountViewmodel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object?> get props => [viewmodel, exception];
}

class NameAccountChangedFormState extends NameAccountState {
  const NameAccountChangedFormState(
      {NameAccountViewmodel viewmodel = const NameAccountViewmodel()})
      : super(viewmodel: viewmodel);
}
