part of 'recovery_phrase_cubit.dart';

abstract class RecoveryPhraseState with EquatableMixin {
  final RecoveryPhraseViewModel model;

  RecoveryPhraseState({required this.model});

  @override
  List<Object?> get props => [model];
}

class RecoveryPhraseInitial extends RecoveryPhraseState {
  RecoveryPhraseInitial() : super(model: RecoveryPhraseViewModel());
}

class RecoveryPhrasePrimaryState extends RecoveryPhraseState {
  RecoveryPhrasePrimaryState({required RecoveryPhraseViewModel model})
      : super(model: model);
}
