// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      operatorAddress: json['operator_address'] as String? ?? '',
      consensusPubkey: json['consensus_pubkey'] == null
          ? const ConsensusPubkey()
          : ConsensusPubkey.fromJson(
              json['consensus_pubkey'] as Map<String, dynamic>),
      status: json['status'] as int? ?? -1,
      tokens: json['tokens'] as String? ?? '',
      delegatorShares: json['delegator_shares'] as String? ?? '',
      description: json['description'] == null
          ? const Description()
          : Description.fromJson(json['description'] as Map<String, dynamic>),
      unbondingTime: json['unbonding_time'] as String? ?? '',
      commission: json['commission'] == null
          ? const Commission()
          : Commission.fromJson(json['commission'] as Map<String, dynamic>),
      minSelfDelegation: json['min_self_delegation'] as String? ?? '',
      unbondingHeight: json['unbonding_height'] as String? ?? '',
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'operator_address': instance.operatorAddress,
      'consensus_pubkey': instance.consensusPubkey,
      'status': instance.status,
      'tokens': instance.tokens,
      'delegator_shares': instance.delegatorShares,
      'description': instance.description,
      'unbonding_time': instance.unbondingTime,
      'commission': instance.commission,
      'min_self_delegation': instance.minSelfDelegation,
      'unbonding_height': instance.unbondingHeight,
    };
