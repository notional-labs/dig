import 'package:equatable/equatable.dart';

class ConfirmRecoveryPhraseDataItem with EquatableMixin {
  final String word;
  bool isSelected;

  ConfirmRecoveryPhraseDataItem({required this.word, this.isSelected = false});

  @override
  List<Object?> get props => [word, isSelected];
}
