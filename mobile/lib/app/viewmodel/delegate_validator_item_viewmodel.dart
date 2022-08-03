import 'package:equatable/equatable.dart';

class DelegateValidatorItemViewmodel extends Equatable {
  final String name;
  final String address;
  final num commsion;
  const DelegateValidatorItemViewmodel({
    this.name = '',
    this.address = '',
    this.commsion = 0,
  });

  DelegateValidatorItemViewmodel copyWith({
    String? name,
    String? address,
    num? commsion,
  }) {
    return DelegateValidatorItemViewmodel(
      name: name ?? this.name,
      address: address ?? this.address,
      commsion: commsion ?? this.commsion,
    );
  }

  @override
  List<Object> get props => [name, address, commsion];
}
