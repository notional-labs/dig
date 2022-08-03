import 'package:dig_mobile_app/app/cubit/staking/delegate/delegate_state.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/viewmodel/delegate_validator_item_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

@injectable
class DelegateCubit extends Cubit<DelegateState> {
  DelegateCubit() : super(const DelegatePrimaryState());

  void init(
      {required delegatorAddress,
      required num tokenAvailable,
      required DelegateValidatorItemViewmodel validatorSelected,
      required List<DelegateValidatorItemViewmodel> validators}) {
    DelegateValidatorItemViewmodel? validator = validators.firstWhereOrNull(
            (element) => element.address == validatorSelected.address) ??
        validators.firstOrNull;
    validator ??= const DelegateValidatorItemViewmodel();

    emit(DelegatePrimaryState(
        viewmodel: state.viewmodel.copyWith(
            delegatorAddress: delegatorAddress,
            tokenAvailable: tokenAvailable,
            validator: validator,
            validators: validators)));
  }

  /// TODO: Impl [delegate]
  Future delegate() async {}

  void changeAdvanceEvent(bool value) {
    emit(DelegateChangedFormState(
        viewmodel: state.viewmodel.copyWith(advance: value, gas: 0)));
    emit(DelegatePrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeDelegatorEvent(String delegatorAddress) {
    emit(DelegateChangedFormState(
        viewmodel:
            state.viewmodel.copyWith(delegatorAddress: delegatorAddress)));
    emit(DelegatePrimaryState(viewmodel: state.viewmodel));
  }

  void changeValidatorEvent(DelegateValidatorItemViewmodel validator) {
    emit(DelegateChangedFormState(
        viewmodel: state.viewmodel.copyWith(validator: validator)));
    emit(DelegatePrimaryState(viewmodel: state.viewmodel));
  }

  void changeTokenToStakeEvent(double tokenToStake) {
    emit(DelegateChangedFormState(
        viewmodel: state.viewmodel.copyWith(tokenToStake: tokenToStake)));
    emit(DelegatePrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeGasEvent(double gas) {
    emit(DelegateChangedFormState(
        viewmodel: state.viewmodel.copyWith(gas: gas)));
    emit(DelegatePrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void closeEvent() => navigatorKey.currentState!.pop();
}
