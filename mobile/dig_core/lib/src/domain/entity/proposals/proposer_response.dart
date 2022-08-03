import 'package:dig_core/src/domain/entity/proposals/proposer_result.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proposer_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProposerResponse with EquatableMixin {
  final String height;
  final ProposerResult result;

  const ProposerResponse(this.height, this.result);

  factory ProposerResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposerResponseToJson(this);

  @override
  List<Object?> get props => [height, result];
}
