import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends Equatable {
  final String? error;
  final int? code;
  final String? message;
  const ErrorResponse({
    this.error,
    this.code,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  ErrorResponse copyWith({
    String? error,
    int? code,
    String? message,
  }) {
    return ErrorResponse(
      error: error ?? this.error,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [error, code, message];
}
