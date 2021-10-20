///
//  Generated code. Do not modify.
//  source: cosmos/staking/v1beta1/authz.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../base/v1beta1/coin.pb.dart' as $2;

import 'authz.pbenum.dart';

export 'authz.pbenum.dart';

class StakeAuthorization_Validators extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StakeAuthorization.Validators', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  StakeAuthorization_Validators._() : super();
  factory StakeAuthorization_Validators({
    $core.Iterable<$core.String>? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address.addAll(address);
    }
    return _result;
  }
  factory StakeAuthorization_Validators.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StakeAuthorization_Validators.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StakeAuthorization_Validators clone() => StakeAuthorization_Validators()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StakeAuthorization_Validators copyWith(void Function(StakeAuthorization_Validators) updates) => super.copyWith((message) => updates(message as StakeAuthorization_Validators)) as StakeAuthorization_Validators; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StakeAuthorization_Validators create() => StakeAuthorization_Validators._();
  StakeAuthorization_Validators createEmptyInstance() => create();
  static $pb.PbList<StakeAuthorization_Validators> createRepeated() => $pb.PbList<StakeAuthorization_Validators>();
  @$core.pragma('dart2js:noInline')
  static StakeAuthorization_Validators getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StakeAuthorization_Validators>(create);
  static StakeAuthorization_Validators? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get address => $_getList(0);
}

enum StakeAuthorization_Validators_ {
  allowList, 
  denyList, 
  notSet
}

class StakeAuthorization extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, StakeAuthorization_Validators_> _StakeAuthorization_Validators_ByTag = {
    2 : StakeAuthorization_Validators_.allowList,
    3 : StakeAuthorization_Validators_.denyList,
    0 : StakeAuthorization_Validators_.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StakeAuthorization', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOM<$2.Coin>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxTokens', subBuilder: $2.Coin.create)
    ..aOM<StakeAuthorization_Validators>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowList', subBuilder: StakeAuthorization_Validators.create)
    ..aOM<StakeAuthorization_Validators>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denyList', subBuilder: StakeAuthorization_Validators.create)
    ..e<AuthorizationType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorizationType', $pb.PbFieldType.OE, defaultOrMaker: AuthorizationType.AUTHORIZATION_TYPE_UNSPECIFIED, valueOf: AuthorizationType.valueOf, enumValues: AuthorizationType.values)
    ..hasRequiredFields = false
  ;

  StakeAuthorization._() : super();
  factory StakeAuthorization({
    $2.Coin? maxTokens,
    StakeAuthorization_Validators? allowList,
    StakeAuthorization_Validators? denyList,
    AuthorizationType? authorizationType,
  }) {
    final _result = create();
    if (maxTokens != null) {
      _result.maxTokens = maxTokens;
    }
    if (allowList != null) {
      _result.allowList = allowList;
    }
    if (denyList != null) {
      _result.denyList = denyList;
    }
    if (authorizationType != null) {
      _result.authorizationType = authorizationType;
    }
    return _result;
  }
  factory StakeAuthorization.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StakeAuthorization.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StakeAuthorization clone() => StakeAuthorization()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StakeAuthorization copyWith(void Function(StakeAuthorization) updates) => super.copyWith((message) => updates(message as StakeAuthorization)) as StakeAuthorization; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StakeAuthorization create() => StakeAuthorization._();
  StakeAuthorization createEmptyInstance() => create();
  static $pb.PbList<StakeAuthorization> createRepeated() => $pb.PbList<StakeAuthorization>();
  @$core.pragma('dart2js:noInline')
  static StakeAuthorization getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StakeAuthorization>(create);
  static StakeAuthorization? _defaultInstance;

  StakeAuthorization_Validators_ whichValidators() => _StakeAuthorization_Validators_ByTag[$_whichOneof(0)]!;
  void clearValidators() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $2.Coin get maxTokens => $_getN(0);
  @$pb.TagNumber(1)
  set maxTokens($2.Coin v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMaxTokens() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxTokens() => clearField(1);
  @$pb.TagNumber(1)
  $2.Coin ensureMaxTokens() => $_ensure(0);

  @$pb.TagNumber(2)
  StakeAuthorization_Validators get allowList => $_getN(1);
  @$pb.TagNumber(2)
  set allowList(StakeAuthorization_Validators v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAllowList() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllowList() => clearField(2);
  @$pb.TagNumber(2)
  StakeAuthorization_Validators ensureAllowList() => $_ensure(1);

  @$pb.TagNumber(3)
  StakeAuthorization_Validators get denyList => $_getN(2);
  @$pb.TagNumber(3)
  set denyList(StakeAuthorization_Validators v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDenyList() => $_has(2);
  @$pb.TagNumber(3)
  void clearDenyList() => clearField(3);
  @$pb.TagNumber(3)
  StakeAuthorization_Validators ensureDenyList() => $_ensure(2);

  @$pb.TagNumber(4)
  AuthorizationType get authorizationType => $_getN(3);
  @$pb.TagNumber(4)
  set authorizationType(AuthorizationType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthorizationType() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthorizationType() => clearField(4);
}

