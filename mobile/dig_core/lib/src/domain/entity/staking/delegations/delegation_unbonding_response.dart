import 'package:dig_core/src/domain/entity/pagination.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation_unbonding_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delegation_unbonding_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DelegationUnBondingResponse with EquatableMixin {
  final List<DelegationUnBondingData> unbondingResponses;
  final Pagination? pagination;

  const DelegationUnBondingResponse(
      {this.unbondingResponses = const <DelegationUnBondingData>[],
      this.pagination});

  factory DelegationUnBondingResponse.fromJson(Map<String, dynamic> json) =>
      _$DelegationUnBondingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DelegationUnBondingResponseToJson(this);

  @override
  List<Object?> get props => [unbondingResponses, pagination];
}
