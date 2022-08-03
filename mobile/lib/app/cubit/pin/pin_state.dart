import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/pin_viewmodel.dart';

abstract class PinState extends Equatable {
  final PinViewmodel viewmodel;
  const PinState({
    this.viewmodel = const PinViewmodel(),
  });

  @override
  List<Object> get props => [viewmodel];
}

class PinPrimaryState extends PinState {
  const PinPrimaryState({PinViewmodel viewmodel = const PinViewmodel()})
      : super(viewmodel: viewmodel);
}

class PinMatchedState extends PinState {
  const PinMatchedState({PinViewmodel viewmodel = const PinViewmodel()})
      : super(viewmodel: viewmodel);
}

class PinChangedState extends PinState {
  const PinChangedState({PinViewmodel viewmodel = const PinViewmodel()})
      : super(viewmodel: viewmodel);
}

class PinErrorState extends PinState {
  final BaseDigException exception;
  const PinErrorState(
      {PinViewmodel viewmodel = const PinViewmodel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [viewmodel, exception];
}
