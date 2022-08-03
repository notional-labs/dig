import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pagination extends Equatable {
  final String nextKey;
  final String total;
  const Pagination({
    this.nextKey = '',
    this.total = '',
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  Pagination copyWith({
    String? nextKey,
    String? total,
  }) {
    return Pagination(
      nextKey: nextKey ?? this.nextKey,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [nextKey, total];
}
