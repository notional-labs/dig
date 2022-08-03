import 'package:equatable/equatable.dart';

class ImportAccountViewmodel extends Equatable {
  final String mnemonic;
  final String mnemonicMessage;

  const ImportAccountViewmodel({
    this.mnemonic = '',
    this.mnemonicMessage = '',
  });

  bool get isValid => mnemonic.isNotEmpty && mnemonicMessage.isEmpty;

  ImportAccountViewmodel copyWith({
    String? mnemonic,
    String? mnemonicMessage,
  }) {
    return ImportAccountViewmodel(
      mnemonic: mnemonic ?? this.mnemonic,
      mnemonicMessage: mnemonicMessage ?? this.mnemonicMessage,
    );
  }

  @override
  List<Object> get props => [mnemonic, mnemonicMessage];
}
