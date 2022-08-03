import 'package:dig_core/src/domain/entity/staking/commission.dart';
import 'package:dig_core/src/domain/entity/staking/consensus_pubkey.dart';
import 'package:dig_core/src/domain/entity/staking/description.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Result extends Equatable {
  final String operatorAddress;
  final ConsensusPubkey consensusPubkey;
  final int status;
  final String tokens;
  final String delegatorShares;
  final Description description;
  final String unbondingTime;
  final Commission commission;
  final String minSelfDelegation;
  final String unbondingHeight;

  const Result({
    this.operatorAddress = '',
    this.consensusPubkey = const ConsensusPubkey(),
    this.status = -1,
    this.tokens = '',
    this.delegatorShares = '',
    this.description = const Description(),
    this.unbondingTime = '',
    this.commission = const Commission(),
    this.minSelfDelegation = '',
    this.unbondingHeight = '',
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Result copyWith({
    String? operatorAddress,
    ConsensusPubkey? consensusPubkey,
    int? status,
    String? tokens,
    String? delegatorShares,
    Description? description,
    String? unbondingTime,
    Commission? commission,
    String? minSelfDelegation,
    String? unbondingHeight,
  }) {
    return Result(
      operatorAddress: operatorAddress ?? this.operatorAddress,
      consensusPubkey: consensusPubkey ?? this.consensusPubkey,
      status: status ?? this.status,
      tokens: tokens ?? this.tokens,
      delegatorShares: delegatorShares ?? this.delegatorShares,
      description: description ?? this.description,
      unbondingTime: unbondingTime ?? this.unbondingTime,
      commission: commission ?? this.commission,
      minSelfDelegation: minSelfDelegation ?? this.minSelfDelegation,
      unbondingHeight: unbondingHeight ?? this.unbondingHeight,
    );
  }

  @override
  List<Object> get props {
    return [
      operatorAddress,
      consensusPubkey,
      status,
      tokens,
      delegatorShares,
      description,
      unbondingTime,
      commission,
      minSelfDelegation,
      unbondingHeight,
    ];
  }
}
