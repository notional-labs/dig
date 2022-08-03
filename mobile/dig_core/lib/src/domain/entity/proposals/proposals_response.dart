import 'package:dig_core/src/domain/entity/pagination.dart';
import 'package:dig_core/src/domain/entity/proposals/proposal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proposals_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProposalsResponse with EquatableMixin {
  final List<Proposal> proposals;
  final Pagination? pagination;

  const ProposalsResponse(
      {this.proposals = const <Proposal>[], this.pagination});

  factory ProposalsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalsResponseToJson(this);

  @override
  List<Object?> get props => [proposals, pagination];
}
