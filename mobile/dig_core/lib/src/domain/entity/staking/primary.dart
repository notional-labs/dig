import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'primary.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Primary extends Equatable {
  final String url;

  const Primary({
    this.url = '',
  });

  factory Primary.fromJson(Map<String, dynamic> json) =>
      _$PrimaryFromJson(json);

  Map<String, dynamic> toJson() => _$PrimaryToJson(this);

  Primary copyWith({
    String? url,
  }) {
    return Primary(
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props => [url];
}
