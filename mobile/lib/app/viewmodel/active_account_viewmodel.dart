import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

class ActiveAccountViewModel extends Equatable {
  final int selectedTab;
  final List<Balance> balances;
  const ActiveAccountViewModel(
      {this.selectedTab = 0, this.balances = const []});

  ActiveAccountViewModel copyWith({int? selectedTab, List<Balance>? balances}) {
    return ActiveAccountViewModel(
        selectedTab: selectedTab ?? this.selectedTab,
        balances: balances ?? this.balances);
  }

  @override
  List<Object> get props => [selectedTab, balances];
}
