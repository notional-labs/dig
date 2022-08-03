import 'package:dig_core/src/domain/entity/staking/commission_rate.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commission.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Commission extends Equatable {
  final CommissionRates commissionRates;
  final String updateTime;

  const Commission({
    this.commissionRates = const CommissionRates(),
    this.updateTime = '',
  });

  factory Commission.fromJson(Map<String, dynamic> json) =>
      _$CommissionFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionToJson(this);

  Commission copyWith({
    CommissionRates? commissionRates,
    String? updateTime,
  }) {
    return Commission(
      commissionRates: commissionRates ?? this.commissionRates,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  List<Object> get props => [commissionRates, updateTime];
}
