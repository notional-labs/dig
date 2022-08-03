import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_item/staking_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class StakingItemCubit extends Cubit<StakingItemState> {
  final GetValidatorLogoUseCase _getValidatorLogoUseCase;
  StakingItemCubit(this._getValidatorLogoUseCase)
      : super(const StakingItemLoadingAvatarState());

  Future fetchAvatar(String identity) async {
    final result = await _getValidatorLogoUseCase
        .call(GetValidatorLogoUseCaseParam(identity: identity));
    result.fold((l) {
      emit(StakingItemLoadAvatarErrorState(exception: l));
    }, (r) {
      emit(StakingItemLoadAvatarSuccessState(avatarUrl: r));
    });
  }
}
