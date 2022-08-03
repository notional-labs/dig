import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entry.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Entry with EquatableMixin {
  final String creationHeight;
  final DateTime? completionTime;
  final String initialBalance;
  final String balance;

  const Entry({
    this.creationHeight = '',
    this.completionTime,
    this.initialBalance = '',
    this.balance = '',
  });

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);

  @override
  List<Object?> get props =>
      [creationHeight, completionTime, initialBalance, balance];
}
