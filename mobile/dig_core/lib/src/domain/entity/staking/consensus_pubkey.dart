import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consensus_pubkey.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ConsensusPubkey extends Equatable {
  final String type;
  final String value;

  const ConsensusPubkey({
    this.type = '',
    this.value = '',
  });

  factory ConsensusPubkey.fromJson(Map<String, dynamic> json) =>
      _$ConsensusPubkeyFromJson(json);

  Map<String, dynamic> toJson() => _$ConsensusPubkeyToJson(this);

  ConsensusPubkey copyWith({
    String? type,
    String? value,
  }) {
    return ConsensusPubkey(
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [type, value];
}
