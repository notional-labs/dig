import 'package:equatable/equatable.dart';

class StakingItemViewModel extends Equatable {
  final String identity;
  final String name;
  final String website;
  final String token;
  final num power;
  final num commsion;
  const StakingItemViewModel({
    required this.identity,
    this.name = '',
    this.website = '',
    this.token = '',
    this.power = 0,
    this.commsion = 0,
  });

  StakingItemViewModel copyWith({
    String? identity,
    String? name,
    String? website,
    String? token,
    num? power,
    num? commsion,
  }) {
    return StakingItemViewModel(
      identity: identity ?? this.identity,
      name: name ?? this.name,
      website: website ?? this.website,
      token: token ?? this.token,
      power: power ?? this.power,
      commsion: commsion ?? this.commsion,
    );
  }

  @override
  List<Object> get props {
    return [
      identity,
      name,
      website,
      token,
      power,
      commsion,
    ];
  }
}
