import 'dart:convert';

import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class AccountAdditionalData {
  const AccountAdditionalData({
    required this.isBackedUp,
  });

  factory AccountAdditionalData.fromJson(Map<String, dynamic> map) {
    return AccountAdditionalData(
      isBackedUp: map['isBackedUp'] as bool? ?? false,
    );
  }

  final bool isBackedUp;

  Map<String, dynamic> toJson() {
    return {
      'isBackedUp': isBackedUp,
    };
  }

  String toJsonString() => jsonEncode(toJson());
}

extension AdditionalDataParsing on AccountPublicInfo {
  AccountAdditionalData get accountAdditionalData =>
      AccountAdditionalData.fromJson(
          jsonDecode(additionalData ?? '{}') as Map<String, dynamic>);
}
