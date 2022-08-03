part of 'active_account_cubit.dart';

abstract class ActiveAccountState extends Equatable {
  final ActiveAccountViewModel viewModel;

  const ActiveAccountState({this.viewModel = const ActiveAccountViewModel()});

  @override
  List<Object> get props => [viewModel];
}

class ActiveAccountInitialState extends ActiveAccountState {
  const ActiveAccountInitialState()
      : super(viewModel: const ActiveAccountViewModel());
}

class ActiveAccountPrimaryState extends ActiveAccountState {
  const ActiveAccountPrimaryState(
      {ActiveAccountViewModel viewModel = const ActiveAccountViewModel()})
      : super(viewModel: viewModel);
}

class ActiveAccountLoadingState extends ActiveAccountState {
  final bool isRefresh;

  const ActiveAccountLoadingState(
      {ActiveAccountViewModel viewModel = const ActiveAccountViewModel(),
      this.isRefresh = false})
      : super(viewModel: viewModel);

  @override
  List<Object> get props => [isRefresh, viewModel];
}

class ActiveAccountScannedBarcodeState extends ActiveAccountState {
  final String barCode;

  const ActiveAccountScannedBarcodeState({
    required this.barCode,
    ActiveAccountViewModel viewModel = const ActiveAccountViewModel(),
  }) : super(viewModel: viewModel);

  @override
  List<Object> get props => [barCode, viewModel];
}

class ActiveAccountErrorState extends ActiveAccountState {
  final BaseDigException exception;

  const ActiveAccountErrorState(
      {ActiveAccountViewModel viewModel = const ActiveAccountViewModel(),
      this.exception = const DigException()})
      : super(viewModel: viewModel);
}
