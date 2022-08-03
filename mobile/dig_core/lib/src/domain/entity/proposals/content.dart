import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/domain/entity/proposals/change.dart';
import 'package:dig_core/src/domain/entity/proposals/plan.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Content with EquatableMixin {
  @JsonKey(name: '@type')
  final String type;
  final String title;
  final String description;
  final String recipient;
  final List<Balance> amount;
  final List<Change> changes;
  final Plan? plan;

  const Content({
    this.type = '',
    this.title = '',
    this.description = '',
    this.recipient = '',
    this.amount = const <Balance>[],
    this.changes = const <Change>[],
    this.plan,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  @override
  List<Object?> get props =>
      [type, title, description, recipient, amount, changes, plan];
}
