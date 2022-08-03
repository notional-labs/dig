import 'package:dig_core/src/domain/entity/balance.dart';
import 'package:dig_core/src/domain/entity/pagination.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance_response.g.dart';

@JsonSerializable()
class BalanceResponse extends Equatable {
  final List<Balance> balances;
  final Pagination pagination;
  const BalanceResponse({
    this.balances = const [],
    this.pagination = const Pagination(),
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);

  BalanceResponse copyWith({
    List<Balance>? balances,
    Pagination? pagination,
  }) {
    return BalanceResponse(
      balances: balances ?? this.balances,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  List<Object?> get props => [balances, pagination];
}
