import 'package:dig_core/src/domain/entity/account_additional_data.dart';
import 'package:equatable/equatable.dart';

class ImportAccountFormData extends Equatable {
  const ImportAccountFormData({
    required this.mnemonic,
    required this.name,
    required this.password,
    required this.additionalData,
  });

  final String mnemonic;
  final String name;
  final String password;
  final AccountAdditionalData additionalData;

  ImportAccountFormData copyWith({
    String? mnemonic,
    String? name,
    String? password,
    AccountAdditionalData? additionalData,
  }) {
    return ImportAccountFormData(
      mnemonic: mnemonic ?? this.mnemonic,
      name: name ?? this.name,
      password: password ?? this.password,
      additionalData: additionalData ?? this.additionalData,
    );
  }

  @override
  List<Object> get props => [mnemonic, name, password, additionalData];
}
