import 'package:bloc/bloc.dart';
import 'package:dig_mobile_app/app/viewmodel/recovery_phrase_viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

part 'recovery_phrase_state.dart';

@Injectable()
class RecoveryPhraseCubit extends Cubit<RecoveryPhraseState> {
  RecoveryPhraseCubit() : super(RecoveryPhraseInitial());

  void init(String mnemonic) {
    emit(RecoveryPhrasePrimaryState(
        model: state.model.copyWith(mnemonics: mnemonic.split(' '))));
  }

  void onCheckBoxClicked(bool isChecked) {
    emit(RecoveryPhrasePrimaryState(
        model: state.model.copyWith(canContinue: isChecked)));
  }

  void copyToClipboard(String mnemonic) {
    Clipboard.setData(ClipboardData(text: mnemonic));
    emit(RecoveryPhrasePrimaryState(
        model: state.model.copyWith(isCopiedToClipboard: true)));
  }
}
