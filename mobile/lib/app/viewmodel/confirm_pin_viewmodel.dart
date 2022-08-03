import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/definition/config.dart';

class ConfirmPinViewmodel extends Equatable {
  final String pin;
  final String confirmPin;
  const ConfirmPinViewmodel({
    this.pin = '',
    this.confirmPin = '',
  });

  bool get isValid =>
      (pin.isNotEmpty && pin.length == PinConfig.length) && pin == confirmPin;

  ConfirmPinViewmodel copyWith({
    String? pin,
    String? confirmPin,
  }) {
    return ConfirmPinViewmodel(
      pin: pin ?? this.pin,
      confirmPin: confirmPin ?? this.confirmPin,
    );
  }

  @override
  List<Object> get props => [pin, confirmPin];
}
