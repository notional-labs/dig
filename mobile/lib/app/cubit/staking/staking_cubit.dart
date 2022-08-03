import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/viewmodel/delegate_validator_item_viewmodel.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_item_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

const List<String> _priorityValidatorAddresses = [
  'digvaloper12hjc5e9z3c4x8hl8yyxlqfx67wr89meaas6k7z',
  'digvaloper1cxu3telmqz2we6s8xy4xckr8sl2n7judqdq629',
  'digvaloper1lu3at7mda24anr9eecdhyt9wsq8dwhrn664y4z'
];

@injectable
class StakingCubit extends Cubit<StakingState> {
  final GetValidatorUseCase _getValidatorUseCase;
  final GetSelectedAccountUseCase _getSelectedAccountUseCase;
  final GetBalanceUseCase _getBalanceUseCase;
  final GetCoinUseCase _getCoinUseCase;
  final GetCoinChartUseCase _getCoinChartUseCase;

  StakingCubit(this._getValidatorUseCase, this._getSelectedAccountUseCase,
      this._getBalanceUseCase, this._getCoinUseCase, this._getCoinChartUseCase)
      : super(const StakingPrimaryState());

  Future fetchData([bool isRefresh = false]) async {
    emit(StakingLoadingState(
        viewmodel: state.viewmodel.copyWith(), isRefresh: isRefresh));

    final List<StakingItemViewModel> stakingItemViewModels = [];
    final List<DelegateValidatorItemViewmodel> validatorItemViewModels = [];

    final results = await Future.wait([
      _getValidatorUseCase.call(const GetValidatorUseCaseParam()),
      _getCoinUseCase.call(
        GetCoinUseCaseParam(
            param: const CoinRequest(
                ids: Chain.digChain, vs_currency: Currency.usd)),
      ),
      _getCoinChartUseCase.call(GetCoinChartUseCaseParam(
          param: const ChartRequest(
              id: Chain.digChain, vs_currency: Currency.usd, days: '1')))
    ]);

    final Either<BaseDigException, ValidatorResponse>
        getValidatorUseCaseResult =
        results.first as Either<BaseDigException, ValidatorResponse>;
    final Either<BaseDigException, List<Market>> _getCoinUseCaseResult =
        results[1] as Either<BaseDigException, List<Market>>;
    final Either<BaseDigException, List<MarketChartPrice>>
        _getCoinChartUseCaseResult =
        results[2] as Either<BaseDigException, List<MarketChartPrice>>;

    num currentPrice = 0;
    num priceChangePercentage24h = 0;
    // ignore: omit_local_variable_types, unused_local_variable
    List<MarketChartPrice> prices = [];

    getValidatorUseCaseResult.fold((failure) {
      emit(StakingErrorState(
          viewmodel: state.viewmodel.copyWith(), exception: failure));
    }, (validator) {
      final ValidatorResponse validatorResponse = validator.copyWith();

      /// Get priority items
      final bogo1 = validatorResponse.result.firstWhereOrNull((element) =>
          element.operatorAddress == _priorityValidatorAddresses[0]);
      final bogo2 = validatorResponse.result.firstWhereOrNull((element) =>
          element.operatorAddress == _priorityValidatorAddresses[1]);
      final bogo3 = validatorResponse.result.firstWhereOrNull((element) =>
          element.operatorAddress == _priorityValidatorAddresses[2]);

      /// Create [listBogo] without `null` item
      final List<Result> listBogo = [bogo2, bogo3, bogo1]
          .where((element) => element != null)
          .toList()
          .cast();

      /// Remove exits bogo
      validatorResponse.result.removeWhere((element) =>
          _priorityValidatorAddresses.contains(element.operatorAddress));

      /// Insert [listBogo] at first
      validatorResponse.result.insertAll(0, listBogo);

      final totalSupply = validatorResponse.result.fold(
          0,
          (num previousValue, element) =>
              previousValue + (double.tryParse(element.delegatorShares) ?? 0));

      for (final element in validatorResponse.result) {
        /// Compute commsion
        final commsion =
            (double.tryParse(element.commission.commissionRates.rate) ?? 0) *
                100;

        /// Compute power
        double power = 0;
        if (totalSupply != 0) {
          power = ((double.tryParse(element.delegatorShares) ?? 0) * 100) /
              totalSupply;
        }

        final StakingItemViewModel stakingItemViewModel = StakingItemViewModel(
          identity: element.description.identity,
          name: element.description.moniker,
          website: element.description.website,
          token: element.tokens,
          power: power,
          commsion: commsion,
        );

        final DelegateValidatorItemViewmodel delegateValidatorItemViewmodel =
            DelegateValidatorItemViewmodel(
          address: element.operatorAddress,
          name: element.description.moniker,
          commsion: commsion,
        );

        stakingItemViewModels.add(stakingItemViewModel);
        validatorItemViewModels.add(delegateValidatorItemViewmodel);
      }
    });

    _getCoinUseCaseResult.fold((failure) {
      emit(StakingErrorState(
          viewmodel: state.viewmodel.copyWith(), exception: failure));
    }, ((markets) {
      if (markets.isNotEmpty) {
        final market = markets.first;
        currentPrice = market.currentPrice;
        priceChangePercentage24h = market.priceChangePercentage24h;
      }
    }));

    _getCoinChartUseCaseResult.fold((failure) {}, (value) {
      prices = value;
    });

    emit(StakingPrimaryState(
        viewmodel: state.viewmodel.copyWith(
            stakingItems: stakingItemViewModels,
            validatorItems: validatorItemViewModels,
            currentPrice: currentPrice,
            priceChangePercentage24h: priceChangePercentage24h)));
  }

  Future tapDelegateEvent(DelegateValidatorItemViewmodel validator) async {
    emit(StakingLoadingState(
        viewmodel: state.viewmodel.copyWith(), isRefresh: false));

    AccountPublicInfo? account;
    num balance = 0;

    BaseDigException? getSelectedAccountUseCaseException;
    final result = await _getSelectedAccountUseCase
        .call(const GetSelectedAccountUseCaseParam());
    result.fold((l) {
      getSelectedAccountUseCaseException = l;
    }, (r) {
      account = r;
    });

    if (getSelectedAccountUseCaseException != null) {
      emit(StakingErrorState(
          exception: getSelectedAccountUseCaseException!,
          viewmodel: state.viewmodel.copyWith()));
      return;
    }

    BaseDigException? getBalanceUseCaseException;
    final _getBalanceUseCaseResult = await _getBalanceUseCase.call(
        GetBalanceUseCaseParam(
            request: BalanceRequest(address: account!.publicAddress),
            denom: Denom.udig));

    _getBalanceUseCaseResult.fold((l) {
      getBalanceUseCaseException = l;
    }, (r) {
      balance = r.getToken();
    });

    if (getBalanceUseCaseException != null) {
      emit(StakingErrorState(
          exception: getBalanceUseCaseException!,
          viewmodel: state.viewmodel.copyWith()));
      return;
    }

    emit(StakingShowDelegateDialogState(
        validatorSelected: validator,
        viewmodel:
            state.viewmodel.copyWith(account: account!, balance: balance)));
    emit(StakingPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  Future refreshEvent() => fetchData(true);
}
