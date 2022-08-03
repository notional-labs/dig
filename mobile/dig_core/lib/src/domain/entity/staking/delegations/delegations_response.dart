import 'package:dig_core/src/domain/entity/pagination.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation_data.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delegations_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DelegationsResponse with EquatableMixin {
  final List<DelegationData> delegationResponses;
  final Pagination? pagination;

  const DelegationsResponse(
      {this.delegationResponses = const <DelegationData>[], this.pagination});

  factory DelegationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DelegationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DelegationsResponseToJson(this);

  @override
  List<Object?> get props => [delegationResponses, pagination];
}
