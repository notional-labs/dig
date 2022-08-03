import 'package:dig_core/src/domain/entity/balance.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reward_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RewardData with EquatableMixin {
  final String validatorAddress;
  final Balance? reward;

  RewardData({this.validatorAddress = '', this.reward});

  factory RewardData.fromJson(Map<String, dynamic> json) =>
      _$RewardDataFromJson(json);

  Map<String, dynamic> toJson() => _$RewardDataToJson(this);

  @override
  List<Object?> get props => [validatorAddress, reward];
}
