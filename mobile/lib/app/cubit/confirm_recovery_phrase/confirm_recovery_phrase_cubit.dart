import 'package:bloc/bloc.dart';
import 'package:dig_mobile_app/app/cubit/confirm_recovery_phrase/confirm_recovery_phrase_data_item.dart';
import 'package:dig_mobile_app/app/viewmodel/confirm_recovery_phrase_viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'confirm_recovery_phrase_state.dart';

@Injectable()
class ConfirmRecoveryPhraseCubit extends Cubit<ConfirmRecoveryPhraseState> {
  late final String mnemonic;
  late final List<String> mnemonicWords;

  ConfirmRecoveryPhraseCubit() : super(ConfirmRecoveryPhraseInitial());

  void init(String mnemonic) {
    this.mnemonic = mnemonic;
    mnemonicWords = mnemonic.split(' ');

    final selectItems = mnemonicWords
        .map((word) => ConfirmRecoveryPhraseDataItem(word: word))
        .toList()
      ..shuffle();

    emit(ConfirmRecoveryPhrasePrimaryState(
        model: ConfirmRecoveryPhraseViewModel(selectItems: selectItems)));
  }

  void selectWord(ConfirmRecoveryPhraseDataItem data) {
    if (data.isSelected) {
      return;
    }
    final currentList =
        List<ConfirmRecoveryPhraseDataItem>.from(state.model.selectItems);
    final confirmList = List<String>.from(state.model.confirmResults);
    currentList.firstWhere((element) => data.word == element.word).isSelected =
        true;
    confirmList.add(data.word);

    var canContinue = false;
    if (confirmList.length == mnemonicWords.length) {
      canContinue = listEquals(confirmList, mnemonicWords);
    }

    emit(ConfirmRecoveryPhrasePrimaryState(
        model: state.model.copyWith(
            selectItems: currentList,
            confirmResults: confirmList,
            canContinue: canContinue)));
  }

  void unSelectWord(String word) {
    final currentList =
        List<ConfirmRecoveryPhraseDataItem>.from(state.model.selectItems);
    final confirmList = List<String>.from(state.model.confirmResults);
    currentList.firstWhere((element) => word == element.word).isSelected =
        false;
    confirmList.remove(word);

    emit(ConfirmRecoveryPhrasePrimaryState(
        model: state.model.copyWith(
            selectItems: currentList,
            confirmResults: confirmList,
            canContinue: listEquals(confirmList, mnemonicWords))));
  }
}
