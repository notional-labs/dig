import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:dig_mobile_app/app/viewmodel/delegate_validator_item_viewmodel.dart';
import 'package:dig_mobile_app/generated/l10n.dart';

class DelegateViewModel extends Equatable {
  final String delegatorAddress;
  final DelegateValidatorItemViewmodel validator;
  final num tokenToStake;
  final num tokenAvailable;
  final num gas;
  final bool advance;
  final List<DelegateValidatorItemViewmodel> validators;

  const DelegateViewModel({
    this.delegatorAddress = '',
    this.validator = const DelegateValidatorItemViewmodel(),
    this.tokenToStake = 0,
    this.tokenAvailable = 0,
    this.gas = 0,
    this.advance = false,
    this.validators = const [],
  });

  bool get isTokenToStakeValid =>
      tokenAvailable > 0 &&
      tokenToStake > 0 &&
      (tokenToStake + gas) <= tokenAvailable.toDigTokenDisplay();

  bool get isGasValid =>
      tokenAvailable > 0 &&
      gas > 0 &&
      (tokenToStake + gas) <= tokenAvailable.toDigTokenDisplay();

  String get tokenToStakeValidMessage {
    if (tokenToStake == 0 || isTokenToStakeValid) {
      return '';
    }

    return S.current.not_enough_token;
  }

  String get gasValidMessage {
    if (gas == 0 || isGasValid) {
      return '';
    }

    return S.current.not_enough_token;
  }

  bool get isValidatorAddressValid => validator.address.isNotEmpty;

  bool get isAllValid => isTokenToStakeValid && isValidatorAddressValid;

  DelegateViewModel copyWith({
    String? delegatorAddress,
    DelegateValidatorItemViewmodel? validator,
    num? tokenToStake,
    num? tokenAvailable,
    num? gas,
    bool? advance,
    List<DelegateValidatorItemViewmodel>? validators,
  }) {
    return DelegateViewModel(
      delegatorAddress: delegatorAddress ?? this.delegatorAddress,
      validator: validator ?? this.validator,
      tokenToStake: tokenToStake ?? this.tokenToStake,
      tokenAvailable: tokenAvailable ?? this.tokenAvailable,
      gas: gas ?? this.gas,
      advance: advance ?? this.advance,
      validators: validators ?? this.validators,
    );
  }

  @override
  List<Object> get props {
    return [
      delegatorAddress,
      validator,
      tokenToStake,
      tokenAvailable,
      gas,
      advance,
      validators,
    ];
  }
}
