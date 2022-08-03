import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Plan with EquatableMixin {
  final String name;
  final String time;
  final String height;
  final String info;

  const Plan({
    this.name = '',
    this.time = '',
    this.height = '',
    this.info = '',
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  @override
  List<Object?> get props => [name, time, height, info];
}
