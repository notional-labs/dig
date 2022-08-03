import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:equatable/equatable.dart';

class TransferTokenViewModel extends Equatable {
  final String senderAddress;
  final String recipientAddress;
  final double tokenToSend;
  final double tokenAvailable;
  final double gas;
  final bool advance;

  const TransferTokenViewModel({
    this.senderAddress = '',
    this.recipientAddress = '',
    this.tokenToSend = 0,
    this.tokenAvailable = 0,
    this.gas = 0,
    this.advance = false,
  });

  bool get isTokenToSendValid {
    if (advance) {
      return tokenAvailable > 0 &&
          tokenToSend > 0 &&
          (tokenToSend + gas) <= tokenAvailable.toDigTokenDisplay();
    }

    return tokenAvailable > 0 &&
        tokenToSend > 0 &&
        (tokenToSend + (Fee.defaultFee / TokenBalanceRatio.ratio)) <=
            tokenAvailable.toDigTokenDisplay();
  }

  bool get isGasValid =>
      tokenAvailable > 0 &&
      gas > 0 &&
      (tokenToSend + gas) <= tokenAvailable.toDigTokenDisplay() &&
      gas >= (Fee.defaultFee / TokenBalanceRatio.ratio);

  String get tokenToSendValidMessage {
    if (tokenToSend == 0 || isTokenToSendValid) {
      return '';
    }

    if (advance) {
      return S.current.not_enough_token;
    }
    return '${S.current.not_enough_token}\n${S.current.gas_default}: ${S.current.dig_token_format(Fee.defaultFee.toDigTokenDisplay())}';
  }

  String get gasValidMessage {
    if (gas == 0 || isGasValid) {
      return '';
    }

    if (gas < (Fee.defaultFee / TokenBalanceRatio.ratio)) {
      return '${S.current.minimum}: ${S.current.dig_token_format(Fee.defaultFee.toDigTokenDisplay())}';
    }

    return S.current.not_enough_token;
  }

  bool get isRecipientValid => recipientAddress.isNotEmpty;

  bool get isAllValid => isTokenToSendValid && isRecipientValid;

  TransferTokenViewModel copyWith({
    String? senderAddress,
    String? recipientAddress,
    double? tokenToSend,
    double? tokenAvailable,
    double? gas,
    bool? advance,
  }) {
    return TransferTokenViewModel(
      senderAddress: senderAddress ?? this.senderAddress,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      tokenToSend: tokenToSend ?? this.tokenToSend,
      tokenAvailable: tokenAvailable ?? this.tokenAvailable,
      gas: gas ?? this.gas,
      advance: advance ?? this.advance,
    );
  }

  @override
  List<Object> get props {
    return [
      senderAddress,
      recipientAddress,
      tokenToSend,
      tokenAvailable,
      gas,
      advance,
    ];
  }
}
