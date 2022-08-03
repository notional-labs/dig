// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dig_core/dig_core.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/cubit/active_account/active_account_cubit.dart' as _i3;
import '../app/cubit/active_account/transfer_token/transfer_token_cubit.dart'
    as _i22;
import '../app/cubit/app/app_cubit.dart' as _i5;
import '../app/cubit/backup_your_wallet/backup_your_wallet_cubit.dart' as _i6;
import '../app/cubit/confirm_pin/confirm_pin_cubit.dart' as _i7;
import '../app/cubit/confirm_recovery_phrase/confirm_recovery_phrase_cubit.dart'
    as _i8;
import '../app/cubit/home/home_cubit.dart' as _i11;
import '../app/cubit/import_account/import_account_cubit.dart' as _i12;
import '../app/cubit/name_account/import_account/name_account_cubit.dart'
    as _i13;
import '../app/cubit/pin/pin_cubit.dart' as _i14;
import '../app/cubit/proposal/create_proposal/create_proposal_cubit.dart'
    as _i9;
import '../app/cubit/proposal/proposal_detail/proposal_detail_cubit.dart'
    as _i15;
import '../app/cubit/proposal/proposals/proposals_cubit.dart' as _i16;
import '../app/cubit/recovery_phrase/recovery_phrase_cubit.dart' as _i17;
import '../app/cubit/sign_in/sign_in_cubit.dart' as _i18;
import '../app/cubit/splash/splash_cubit.dart' as _i19;
import '../app/cubit/staking/delegate/delegate_cubit.dart' as _i10;
import '../app/cubit/staking/staking_cubit.dart' as _i20;
import '../app/cubit/staking/staking_item/staking_item_cubit.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ActiveAccountCubit>(
      () => _i3.ActiveAccountCubit(get<_i4.GetListBalanceUseCase>()));
  gh.factory<_i5.AppCubit>(() => _i5.AppCubit(
      get<_i4.GetSelectedAccountUseCase>(), get<_i4.CheckHasPinUseCase>()));
  gh.factory<_i6.BackupYourWalletCubit>(
      () => _i6.BackupYourWalletCubit(get<_i4.CreateMnemonicUseCase>()));
  gh.factory<_i7.ConfirmPinCubit>(
      () => _i7.ConfirmPinCubit(get<_i4.CreatePinUseCase>()));
  gh.factory<_i8.ConfirmRecoveryPhraseCubit>(
      () => _i8.ConfirmRecoveryPhraseCubit());
  gh.factory<_i9.CreateProposalCubit>(() => _i9.CreateProposalCubit());
  gh.factory<_i10.DelegateCubit>(() => _i10.DelegateCubit());
  gh.factory<_i11.HomeCubit>(() => _i11.HomeCubit(
      get<_i4.GetSelectedAccountUseCase>(),
      get<_i4.GetListAccountUseCase>(),
      get<_i4.SelectAccountUseCase>(),
      get<_i4.RemoveAccountUseCase>(),
      get<_i4.DeletePinUseCase>(),
      get<_i4.GetListBalanceUseCase>()));
  gh.factory<_i12.ImportAccountCubit>(
      () => _i12.ImportAccountCubit(get<_i4.CheckMnemonicValidUseCase>()));
  gh.factory<_i13.NameAccountCubit>(() => _i13.NameAccountCubit(
      get<_i4.ImportAccountUseCase>(),
      get<_i4.CheckHasPinUseCase>(),
      get<_i4.SelectAccountUseCase>()));
  gh.factory<_i14.PinCubit>(() => _i14.PinCubit(get<_i4.MatchPinUseCase>()));
  gh.factory<_i15.ProposalDetailCubit>(
      () => _i15.ProposalDetailCubit(get<_i4.GetProposerUseCase>()));
  gh.factory<_i16.ProposalsCubit>(
      () => _i16.ProposalsCubit(get<_i4.GetProposalsUseCase>()));
  gh.factory<_i17.RecoveryPhraseCubit>(() => _i17.RecoveryPhraseCubit());
  gh.factory<_i18.SignInCubit>(() => _i18.SignInCubit());
  gh.factory<_i19.SplashCubit>(() => _i19.SplashCubit(
      get<_i4.GetSelectedAccountUseCase>(),
      get<_i4.CheckHasPinUseCase>(),
      get<_i4.CheckFirstTimeRunAppUseCase>(),
      get<_i4.DeletePinUseCase>()));
  gh.factory<_i20.StakingCubit>(() => _i20.StakingCubit(
      get<_i4.GetValidatorUseCase>(),
      get<_i4.GetSelectedAccountUseCase>(),
      get<_i4.GetBalanceUseCase>(),
      get<_i4.GetCoinUseCase>(),
      get<_i4.GetCoinChartUseCase>()));
  gh.factory<_i21.StakingItemCubit>(
      () => _i21.StakingItemCubit(get<_i4.GetValidatorLogoUseCase>()));
  gh.factory<_i22.TransferTokenCubit>(
      () => _i22.TransferTokenCubit(get<_i4.SendTokenUsecase>()));
  return get;
}
