import 'package:dig_core/src/domain/entity/staking/result.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validator_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ValidatorResponse extends Equatable {
  final String height;
  final List<Result> result;

  const ValidatorResponse({
    this.height = '',
    this.result = const [],
  });

  factory ValidatorResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidatorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidatorResponseToJson(this);

  ValidatorResponse copyWith({
    String? height,
    List<Result>? result,
  }) {
    return ValidatorResponse(
      height: height ?? this.height,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [height, result];
}
