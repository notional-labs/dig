import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delegation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Delegation with EquatableMixin {
  final String delegatorAddress;
  final String validatorAddress;
  final String shares;

  Delegation(
      {this.delegatorAddress = '',
      this.validatorAddress = '',
      this.shares = ''});

  factory Delegation.fromJson(Map<String, dynamic> json) =>
      _$DelegationFromJson(json);

  Map<String, dynamic> toJson() => _$DelegationToJson(this);

  @override
  List<Object?> get props => [delegatorAddress, validatorAddress, shares];
}
