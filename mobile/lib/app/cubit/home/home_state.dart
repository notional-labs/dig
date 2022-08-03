import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/home_viewmodel.dart';

abstract class HomeState extends Equatable {
  final HomeViewModel viewModel;
  const HomeState({this.viewModel = const HomeViewModel()});

  @override
  List<Object> get props => [viewModel];
}

class HomeInitialSate extends HomeState {
  const HomeInitialSate() : super(viewModel: const HomeViewModel());
}

class HomePrimaryState extends HomeState {
  const HomePrimaryState({HomeViewModel viewModel = const HomeViewModel()})
      : super(viewModel: viewModel);
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({HomeViewModel viewModel = const HomeViewModel()})
      : super(viewModel: viewModel);
}

class HomeChangedAccountState extends HomeState {
  const HomeChangedAccountState(
      {HomeViewModel viewModel = const HomeViewModel()})
      : super(viewModel: viewModel);
}

class HomeScannerBarcodeState extends HomeState {
  final String barCode;

  const HomeScannerBarcodeState(
      {required this.barCode, HomeViewModel viewModel = const HomeViewModel()})
      : super(viewModel: viewModel);

  @override
  List<Object> get props => [...super.props, barCode];
}

class HomeErrorState extends HomeState {
  final BaseDigException exception;
  const HomeErrorState(
      {HomeViewModel viewModel = const HomeViewModel(),
      this.exception = const DigException()})
      : super(viewModel: viewModel);

  @override
  List<Object> get props => [viewModel, exception];
}
