import 'package:equatable/equatable.dart';

class RecoveryPhraseViewModel with EquatableMixin {
  final List<String> mnemonics;
  final bool canContinue;
  final bool isCopiedToClipboard;

  RecoveryPhraseViewModel(
      {this.mnemonics = const <String>[],
      this.canContinue = false,
      this.isCopiedToClipboard = false});

  RecoveryPhraseViewModel copyWith(
          {List<String>? mnemonics,
          bool? canContinue,
          bool? isCopiedToClipboard}) =>
      RecoveryPhraseViewModel(
          mnemonics: mnemonics ?? this.mnemonics,
          canContinue: canContinue ?? this.canContinue,
          isCopiedToClipboard: isCopiedToClipboard ?? this.isCopiedToClipboard);

  @override
  List<Object?> get props => [mnemonics, canContinue, isCopiedToClipboard];
}
