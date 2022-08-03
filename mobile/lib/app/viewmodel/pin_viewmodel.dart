import 'package:equatable/equatable.dart';

class PinViewmodel extends Equatable {
  final String pin;
  const PinViewmodel({
    this.pin = '',
  });

  PinViewmodel copyWith({
    String? pin,
  }) {
    return PinViewmodel(
      pin: pin ?? this.pin,
    );
  }

  @override
  List<Object> get props => [pin];
}
