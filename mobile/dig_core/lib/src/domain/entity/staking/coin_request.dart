import 'package:equatable/equatable.dart';

class CoinRequest extends Equatable {
  final String ids;
  final String vs_currency;
  const CoinRequest({
    required this.ids,
    required this.vs_currency,
  });

  CoinRequest copyWith({
    String? ids,
    String? vs_currency,
  }) {
    return CoinRequest(
      ids: ids ?? this.ids,
      vs_currency: vs_currency ?? this.vs_currency,
    );
  }

  @override
  List<Object> get props => [ids, vs_currency];
}
