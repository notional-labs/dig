import 'package:dig_core/src/domain/entity/pagination.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/reward_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delegator_rewards_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DelegatorRewardsResponse with EquatableMixin {
  final List<RewardData> rewards;
  final Pagination? pagination;

  const DelegatorRewardsResponse(
      {this.rewards = const <RewardData>[], this.pagination});

  factory DelegatorRewardsResponse.fromJson(Map<String, dynamic> json) =>
      _$DelegatorRewardsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DelegatorRewardsResponseToJson(this);

  @override
  List<Object?> get props => [rewards, pagination];
}
