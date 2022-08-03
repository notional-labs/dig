import 'package:dig_core/src/domain/entity/balance.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delegation_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DelegationData with EquatableMixin {
  final Delegation? delegation;
  final Balance? balance;

  DelegationData({this.delegation, this.balance});

  factory DelegationData.fromJson(Map<String, dynamic> json) =>
      _$DelegationDataFromJson(json);

  Map<String, dynamic> toJson() => _$DelegationDataToJson(this);

  @override
  List<Object?> get props => [delegation, balance];
}
