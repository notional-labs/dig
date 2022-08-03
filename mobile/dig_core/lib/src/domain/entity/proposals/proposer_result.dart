import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proposer_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProposerResult with EquatableMixin {
  final String proposalId;
  final String proposer;

  const ProposerResult({this.proposalId = '', this.proposer = ''});

  factory ProposerResult.fromJson(Map<String, dynamic> json) =>
      _$ProposerResultFromJson(json);

  Map<String, dynamic> toJson() => _$ProposerResultToJson(this);

  @override
  List<Object?> get props => [proposalId, proposer];
}
