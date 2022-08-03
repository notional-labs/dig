import 'package:dig_core/src/domain/entity/balance.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

class SendTokenRequest extends Equatable {
  final AccountPublicInfo info;
  final Balance balance;
  final String toAddress;
  final String password;
  final Balance fee;
  const SendTokenRequest({
    required this.info,
    required this.balance,
    required this.toAddress,
    required this.password,
    required this.fee,
  });

  SendTokenRequest copyWith({
    AccountPublicInfo? info,
    Balance? balance,
    String? toAddress,
    String? password,
    Balance? fee,
  }) {
    return SendTokenRequest(
      info: info ?? this.info,
      balance: balance ?? this.balance,
      toAddress: toAddress ?? this.toAddress,
      password: password ?? this.password,
      fee: fee ?? this.fee,
    );
  }

  @override
  List<Object> get props {
    return [
      info,
      balance,
      toAddress,
      password,
      fee,
    ];
  }
}
