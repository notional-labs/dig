import 'package:dig_mobile_app/app/cubit/confirm_recovery_phrase/confirm_recovery_phrase_data_item.dart';
import 'package:equatable/equatable.dart';

class ConfirmRecoveryPhraseViewModel with EquatableMixin {
  final List<String> confirmResults;
  final List<ConfirmRecoveryPhraseDataItem> selectItems;
  final bool canContinue;

  ConfirmRecoveryPhraseViewModel(
      {this.confirmResults = const <String>[],
      this.selectItems = const <ConfirmRecoveryPhraseDataItem>[],
      this.canContinue = false});

  ConfirmRecoveryPhraseViewModel copyWith(
          {List<String>? confirmResults,
          List<ConfirmRecoveryPhraseDataItem>? selectItems,
          bool? canContinue}) =>
      ConfirmRecoveryPhraseViewModel(
          confirmResults: confirmResults ?? this.confirmResults,
          selectItems: selectItems ?? this.selectItems,
          canContinue: canContinue ?? this.canContinue);

  @override
  List<Object?> get props => [confirmResults, selectItems, canContinue];
}
