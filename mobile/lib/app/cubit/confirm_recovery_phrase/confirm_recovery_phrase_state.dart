part of 'confirm_recovery_phrase_cubit.dart';

abstract class ConfirmRecoveryPhraseState with EquatableMixin {
  final ConfirmRecoveryPhraseViewModel model;

  ConfirmRecoveryPhraseState({required this.model});

  @override
  List<Object?> get props => [model];
}

class ConfirmRecoveryPhraseInitial extends ConfirmRecoveryPhraseState {
  ConfirmRecoveryPhraseInitial()
      : super(model: ConfirmRecoveryPhraseViewModel());
}

class ConfirmRecoveryPhrasePrimaryState extends ConfirmRecoveryPhraseState {
  ConfirmRecoveryPhrasePrimaryState(
      {required ConfirmRecoveryPhraseViewModel model})
      : super(model: model);
}
