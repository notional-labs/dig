import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commission_rate.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CommissionRates extends Equatable {
  final String rate;
  final String maxRate;
  final String maxChangeRate;

  const CommissionRates({
    this.rate = '',
    this.maxRate = '',
    this.maxChangeRate = '',
  });

  factory CommissionRates.fromJson(Map<String, dynamic> json) =>
      _$CommissionRatesFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionRatesToJson(this);

  CommissionRates copyWith({
    String? rate,
    String? maxRate,
    String? maxChangeRate,
  }) {
    return CommissionRates(
      rate: rate ?? this.rate,
      maxRate: maxRate ?? this.maxRate,
      maxChangeRate: maxChangeRate ?? this.maxChangeRate,
    );
  }

  @override
  List<Object> get props => [rate, maxRate, maxChangeRate];
}
