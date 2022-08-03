import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/page/home/home_drawer.dart';
import 'package:equatable/equatable.dart';

class HomeViewModel extends Equatable {
  final AccountPublicInfo? account;
  final List<AccountPublicInfo> accounts;
  final DrawerMenu currentDrawerMenu;
  final List<Balance> balances;

  AccountPublicInfo get getAccount => account!;

  const HomeViewModel(
      {this.account,
      this.accounts = const [],
      this.currentDrawerMenu = DrawerMenu.account,
      this.balances = const []});

  HomeViewModel copyWith(
      {AccountPublicInfo? account,
      List<AccountPublicInfo>? accounts,
      DrawerMenu? currentHomePage,
      List<Balance>? balances}) {
    return HomeViewModel(
        account: account ?? this.account,
        accounts: accounts ?? this.accounts,
        currentDrawerMenu: currentHomePage ?? currentDrawerMenu,
        balances: balances ?? this.balances);
  }

  @override
  List<Object?> get props => [account, accounts, currentDrawerMenu, balances];
}
