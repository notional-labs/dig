import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Status extends Equatable {
  final int code;
  final String name;

  const Status({
    this.code = -1,
    this.name = '',
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  Status copyWith({
    int? code,
    String? name,
  }) {
    return Status(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [code, name];
}
