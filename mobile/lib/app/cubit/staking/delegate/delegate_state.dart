import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/delegate_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class DelegateState extends Equatable {
  final DelegateViewModel viewmodel;
  const DelegateState({
    this.viewmodel = const DelegateViewModel(),
  });

  @override
  List<Object> get props => [viewmodel];
}

class DelegatePrimaryState extends DelegateState {
  const DelegatePrimaryState(
      {DelegateViewModel viewmodel = const DelegateViewModel()})
      : super(viewmodel: viewmodel);
}

class DelegateSendingState extends DelegateState {
  const DelegateSendingState(
      {DelegateViewModel viewmodel = const DelegateViewModel()})
      : super(viewmodel: viewmodel);
}

class DelegateSuccessState extends DelegateState {
  const DelegateSuccessState(
      {DelegateViewModel viewmodel = const DelegateViewModel()})
      : super(viewmodel: viewmodel);
}

class DelegateChangedFormState extends DelegateState {
  const DelegateChangedFormState(
      {DelegateViewModel viewmodel = const DelegateViewModel()})
      : super(viewmodel: viewmodel);
}

class DelegateErrorState extends DelegateState {
  final BaseDigException exception;
  const DelegateErrorState(
      {DelegateViewModel viewmodel = const DelegateViewModel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [exception, viewmodel];
}
