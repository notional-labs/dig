import 'package:equatable/equatable.dart';

class BalanceRequest extends Equatable {
  final String address;
  final String? nextPageKey;
  final int limit;

  const BalanceRequest({
    required this.address,
    this.nextPageKey,
    this.limit = 15,
  });

  BalanceRequest copyWith({
    String? address,
    String? nextPageKey,
    int? limit,
  }) {
    return BalanceRequest(
      address: address ?? this.address,
      nextPageKey: nextPageKey ?? this.nextPageKey,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [address, nextPageKey, limit];
}
