import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Change with EquatableMixin {
  final String subspace;
  final String key;
  final String value;

  const Change({
    this.subspace = '',
    this.key = '',
    this.value = '',
  });

  factory Change.fromJson(Map<String, dynamic> json) => _$ChangeFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeToJson(this);

  @override
  List<Object?> get props => [subspace, key, value];
}
