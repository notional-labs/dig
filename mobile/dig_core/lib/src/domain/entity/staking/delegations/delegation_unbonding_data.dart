import 'package:dig_core/src/domain/entity/staking/delegations/entry.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delegation_unbonding_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DelegationUnBondingData with EquatableMixin {
  final String delegatorAddress;
  final String validatorAddress;
  final List<Entry> entries;

  DelegationUnBondingData(
      {this.delegatorAddress = '',
      this.validatorAddress = '',
      this.entries = const <Entry>[]});

  factory DelegationUnBondingData.fromJson(Map<String, dynamic> json) =>
      _$DelegationUnBondingDataFromJson(json);

  Map<String, dynamic> toJson() => _$DelegationUnBondingDataToJson(this);

  @override
  List<Object?> get props => [delegatorAddress, validatorAddress, entries];
}
