import 'package:dig_core/src/domain/entity/staking/status.dart';
import 'package:dig_core/src/domain/entity/staking/them.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logo_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LogoResponse extends Equatable {
  final Status status;
  final List<Them> them;

  const LogoResponse({
    this.status = const Status(),
    this.them = const [],
  });

  factory LogoResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoResponseToJson(this);

  LogoResponse copyWith({
    Status? status,
    List<Them>? them,
  }) {
    return LogoResponse(
      status: status ?? this.status,
      them: them ?? this.them,
    );
  }

  @override
  List<Object> get props => [status, them];
}
