import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CreateMnemonic extends Equatable {
  final int strength;
  final VoidCallback? onMnemonicGenerationStarted;
  const CreateMnemonic({
    this.strength = 128,
    this.onMnemonicGenerationStarted,
  });

  CreateMnemonic copyWith({
    int? strength,
    VoidCallback? onMnemonicGenerationStarted,
  }) {
    return CreateMnemonic(
      strength: strength ?? this.strength,
      onMnemonicGenerationStarted:
          onMnemonicGenerationStarted ?? this.onMnemonicGenerationStarted,
    );
  }

  @override
  List<Object?> get props => [strength, onMnemonicGenerationStarted];
}
