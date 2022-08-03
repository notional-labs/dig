import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

abstract class StakingItemState extends Equatable {
  final String avatarUrl;
  const StakingItemState({
    this.avatarUrl = '',
  });

  @override
  List<Object> get props => [avatarUrl];
}

class StakingItemLoadingAvatarState extends StakingItemState {
  const StakingItemLoadingAvatarState({String avatarUrl = ''})
      : super(avatarUrl: avatarUrl);
}

class StakingItemLoadAvatarSuccessState extends StakingItemState {
  const StakingItemLoadAvatarSuccessState({String avatarUrl = ''})
      : super(avatarUrl: avatarUrl);
}

class StakingItemLoadAvatarErrorState extends StakingItemState {
  final BaseDigException exception;
  const StakingItemLoadAvatarErrorState(
      {String avatarUrl = '', this.exception = const DigException()})
      : super(avatarUrl: avatarUrl);

  @override
  List<Object> get props => [avatarUrl, exception];
}
