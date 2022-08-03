import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/delegate_validator_item_viewmodel.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_item_viewmodel.dart';

class StakingViewmodel extends Equatable {
  final AccountPublicInfo? account;
  final num balance;
  final List<StakingItemViewModel> stakingItems;
  final List<DelegateValidatorItemViewmodel> validatorItems;
  final num currentPrice;
  final num priceChangePercentage24h;
  const StakingViewmodel({
    this.account,
    this.balance = 0,
    this.stakingItems = const [],
    this.validatorItems = const [],
    this.currentPrice = 0,
    this.priceChangePercentage24h = 0,
  });

  AccountPublicInfo get getAccount => account!;

  bool get isPriceChangePercentage24hDown => priceChangePercentage24h < 0;

  StakingViewmodel copyWith({
    AccountPublicInfo? account,
    num? balance,
    List<StakingItemViewModel>? stakingItems,
    List<DelegateValidatorItemViewmodel>? validatorItems,
    num? currentPrice,
    num? priceChangePercentage24h,
  }) {
    return StakingViewmodel(
      account: account ?? this.account,
      balance: balance ?? this.balance,
      stakingItems: stakingItems ?? this.stakingItems,
      validatorItems: validatorItems ?? this.validatorItems,
      currentPrice: currentPrice ?? this.currentPrice,
      priceChangePercentage24h:
          priceChangePercentage24h ?? this.priceChangePercentage24h,
    );
  }

  @override
  List<Object?> get props {
    return [
      account,
      balance,
      stakingItems,
      validatorItems,
      currentPrice,
      priceChangePercentage24h,
    ];
  }
}
