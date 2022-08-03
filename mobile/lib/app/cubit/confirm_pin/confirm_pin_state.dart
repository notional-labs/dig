import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/confirm_pin_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class ConfirmPinState extends Equatable {
  final ConfirmPinViewmodel viewmodel;
  const ConfirmPinState({
    this.viewmodel = const ConfirmPinViewmodel(),
  });

  @override
  List<Object> get props => [viewmodel];
}

class ConfirmPinPrimaryState extends ConfirmPinState {
  const ConfirmPinPrimaryState(
      {ConfirmPinViewmodel viewmodel = const ConfirmPinViewmodel()})
      : super(viewmodel: viewmodel);
}

class ConfirmPinChangedState extends ConfirmPinState {
  const ConfirmPinChangedState(
      {ConfirmPinViewmodel viewmodel = const ConfirmPinViewmodel()})
      : super(viewmodel: viewmodel);
}

class ConfirmPinSuccessState extends ConfirmPinState {
  const ConfirmPinSuccessState(
      {ConfirmPinViewmodel viewmodel = const ConfirmPinViewmodel()})
      : super(viewmodel: viewmodel);
}

class ConfirmPinErrorState extends ConfirmPinState {
  final BaseDigException exception;
  const ConfirmPinErrorState(
      {ConfirmPinViewmodel viewmodel = const ConfirmPinViewmodel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [viewmodel, exception];
}
