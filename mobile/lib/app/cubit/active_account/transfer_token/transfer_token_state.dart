import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/transfer_token_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class TransferTokenState extends Equatable {
  final TransferTokenViewModel viewmodel;
  const TransferTokenState({
    this.viewmodel = const TransferTokenViewModel(),
  });

  @override
  List<Object> get props => [viewmodel];
}

class TransferTokenPrimaryState extends TransferTokenState {
  const TransferTokenPrimaryState(
      {TransferTokenViewModel viewmodel = const TransferTokenViewModel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenSendingState extends TransferTokenState {
  const TransferTokenSendingState(
      {TransferTokenViewModel viewmodel = const TransferTokenViewModel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenSuccessState extends TransferTokenState {
  const TransferTokenSuccessState(
      {TransferTokenViewModel viewmodel = const TransferTokenViewModel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenChangedFormState extends TransferTokenState {
  const TransferTokenChangedFormState(
      {TransferTokenViewModel viewmodel = const TransferTokenViewModel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenErrorState extends TransferTokenState {
  final BaseDigException exception;
  const TransferTokenErrorState(
      {TransferTokenViewModel viewmodel = const TransferTokenViewModel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [exception, viewmodel];
}
