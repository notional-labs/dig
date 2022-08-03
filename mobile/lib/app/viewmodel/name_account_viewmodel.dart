import 'package:equatable/equatable.dart';

class NameAccountViewmodel extends Equatable {
  final String name;
  final String mnemonic;

  const NameAccountViewmodel({
    this.name = '',
    this.mnemonic = '',
  });

  bool get isValid => name.isNotEmpty && mnemonic.isNotEmpty;

  NameAccountViewmodel copyWith({
    String? name,
    String? mnemonic,
  }) {
    return NameAccountViewmodel(
      name: name ?? this.name,
      mnemonic: mnemonic ?? this.mnemonic,
    );
  }

  @override
  List<Object> get props => [name, mnemonic];
}
