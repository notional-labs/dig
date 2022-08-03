import 'package:equatable/equatable.dart';

class ChartRequest extends Equatable {
  final String id;
  final String vs_currency;
  final String days;
  const ChartRequest({
    required this.id,
    required this.vs_currency,
    required this.days,
  });

  ChartRequest copyWith({
    String? id,
    String? vs_currency,
    String? days,
  }) {
    return ChartRequest(
      id: id ?? this.id,
      vs_currency: vs_currency ?? this.vs_currency,
      days: days ?? this.days,
    );
  }

  @override
  List<Object> get props => [id, vs_currency, days];
}
