///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/feegrant.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../base/v1beta1/coin.pb.dart' as $2;
import '../../../google/protobuf/timestamp.pb.dart' as $3;
import '../../../google/protobuf/duration.pb.dart' as $4;
import '../../../google/protobuf/any.pb.dart' as $5;

class BasicAllowance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BasicAllowance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..pc<$2.Coin>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spendLimit', $pb.PbFieldType.PM, subBuilder: $2.Coin.create)
    ..aOM<$3.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiration', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  BasicAllowance._() : super();
  factory BasicAllowance({
    $core.Iterable<$2.Coin>? spendLimit,
    $3.Timestamp? expiration,
  }) {
    final _result = create();
    if (spendLimit != null) {
      _result.spendLimit.addAll(spendLimit);
    }
    if (expiration != null) {
      _result.expiration = expiration;
    }
    return _result;
  }
  factory BasicAllowance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BasicAllowance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BasicAllowance clone() => BasicAllowance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BasicAllowance copyWith(void Function(BasicAllowance) updates) => super.copyWith((message) => updates(message as BasicAllowance)) as BasicAllowance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BasicAllowance create() => BasicAllowance._();
  BasicAllowance createEmptyInstance() => create();
  static $pb.PbList<BasicAllowance> createRepeated() => $pb.PbList<BasicAllowance>();
  @$core.pragma('dart2js:noInline')
  static BasicAllowance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BasicAllowance>(create);
  static BasicAllowance? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Coin> get spendLimit => $_getList(0);

  @$pb.TagNumber(2)
  $3.Timestamp get expiration => $_getN(1);
  @$pb.TagNumber(2)
  set expiration($3.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiration() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiration() => clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureExpiration() => $_ensure(1);
}

class PeriodicAllowance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PeriodicAllowance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOM<BasicAllowance>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basic', subBuilder: BasicAllowance.create)
    ..aOM<$4.Duration>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'period', subBuilder: $4.Duration.create)
    ..pc<$2.Coin>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'periodSpendLimit', $pb.PbFieldType.PM, subBuilder: $2.Coin.create)
    ..pc<$2.Coin>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'periodCanSpend', $pb.PbFieldType.PM, subBuilder: $2.Coin.create)
    ..aOM<$3.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'periodReset', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  PeriodicAllowance._() : super();
  factory PeriodicAllowance({
    BasicAllowance? basic,
    $4.Duration? period,
    $core.Iterable<$2.Coin>? periodSpendLimit,
    $core.Iterable<$2.Coin>? periodCanSpend,
    $3.Timestamp? periodReset,
  }) {
    final _result = create();
    if (basic != null) {
      _result.basic = basic;
    }
    if (period != null) {
      _result.period = period;
    }
    if (periodSpendLimit != null) {
      _result.periodSpendLimit.addAll(periodSpendLimit);
    }
    if (periodCanSpend != null) {
      _result.periodCanSpend.addAll(periodCanSpend);
    }
    if (periodReset != null) {
      _result.periodReset = periodReset;
    }
    return _result;
  }
  factory PeriodicAllowance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeriodicAllowance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeriodicAllowance clone() => PeriodicAllowance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeriodicAllowance copyWith(void Function(PeriodicAllowance) updates) => super.copyWith((message) => updates(message as PeriodicAllowance)) as PeriodicAllowance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PeriodicAllowance create() => PeriodicAllowance._();
  PeriodicAllowance createEmptyInstance() => create();
  static $pb.PbList<PeriodicAllowance> createRepeated() => $pb.PbList<PeriodicAllowance>();
  @$core.pragma('dart2js:noInline')
  static PeriodicAllowance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeriodicAllowance>(create);
  static PeriodicAllowance? _defaultInstance;

  @$pb.TagNumber(1)
  BasicAllowance get basic => $_getN(0);
  @$pb.TagNumber(1)
  set basic(BasicAllowance v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBasic() => $_has(0);
  @$pb.TagNumber(1)
  void clearBasic() => clearField(1);
  @$pb.TagNumber(1)
  BasicAllowance ensureBasic() => $_ensure(0);

  @$pb.TagNumber(2)
  $4.Duration get period => $_getN(1);
  @$pb.TagNumber(2)
  set period($4.Duration v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPeriod() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeriod() => clearField(2);
  @$pb.TagNumber(2)
  $4.Duration ensurePeriod() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$2.Coin> get periodSpendLimit => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$2.Coin> get periodCanSpend => $_getList(3);

  @$pb.TagNumber(5)
  $3.Timestamp get periodReset => $_getN(4);
  @$pb.TagNumber(5)
  set periodReset($3.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPeriodReset() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriodReset() => clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensurePeriodReset() => $_ensure(4);
}

class AllowedMsgAllowance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AllowedMsgAllowance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOM<$5.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowance', subBuilder: $5.Any.create)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowedMessages')
    ..hasRequiredFields = false
  ;

  AllowedMsgAllowance._() : super();
  factory AllowedMsgAllowance({
    $5.Any? allowance,
    $core.Iterable<$core.String>? allowedMessages,
  }) {
    final _result = create();
    if (allowance != null) {
      _result.allowance = allowance;
    }
    if (allowedMessages != null) {
      _result.allowedMessages.addAll(allowedMessages);
    }
    return _result;
  }
  factory AllowedMsgAllowance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AllowedMsgAllowance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AllowedMsgAllowance clone() => AllowedMsgAllowance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AllowedMsgAllowance copyWith(void Function(AllowedMsgAllowance) updates) => super.copyWith((message) => updates(message as AllowedMsgAllowance)) as AllowedMsgAllowance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AllowedMsgAllowance create() => AllowedMsgAllowance._();
  AllowedMsgAllowance createEmptyInstance() => create();
  static $pb.PbList<AllowedMsgAllowance> createRepeated() => $pb.PbList<AllowedMsgAllowance>();
  @$core.pragma('dart2js:noInline')
  static AllowedMsgAllowance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AllowedMsgAllowance>(create);
  static AllowedMsgAllowance? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Any get allowance => $_getN(0);
  @$pb.TagNumber(1)
  set allowance($5.Any v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAllowance() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowance() => clearField(1);
  @$pb.TagNumber(1)
  $5.Any ensureAllowance() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get allowedMessages => $_getList(1);
}

class Grant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Grant', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..aOM<$5.Any>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowance', subBuilder: $5.Any.create)
    ..hasRequiredFields = false
  ;

  Grant._() : super();
  factory Grant({
    $core.String? granter,
    $core.String? grantee,
    $5.Any? allowance,
  }) {
    final _result = create();
    if (granter != null) {
      _result.granter = granter;
    }
    if (grantee != null) {
      _result.grantee = grantee;
    }
    if (allowance != null) {
      _result.allowance = allowance;
    }
    return _result;
  }
  factory Grant.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Grant.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Grant clone() => Grant()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Grant copyWith(void Function(Grant) updates) => super.copyWith((message) => updates(message as Grant)) as Grant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Grant create() => Grant._();
  Grant createEmptyInstance() => create();
  static $pb.PbList<Grant> createRepeated() => $pb.PbList<Grant>();
  @$core.pragma('dart2js:noInline')
  static Grant getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Grant>(create);
  static Grant? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get granter => $_getSZ(0);
  @$pb.TagNumber(1)
  set granter($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGranter() => $_has(0);
  @$pb.TagNumber(1)
  void clearGranter() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get grantee => $_getSZ(1);
  @$pb.TagNumber(2)
  set grantee($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGrantee() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrantee() => clearField(2);

  @$pb.TagNumber(3)
  $5.Any get allowance => $_getN(2);
  @$pb.TagNumber(3)
  set allowance($5.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowance() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowance() => clearField(3);
  @$pb.TagNumber(3)
  $5.Any ensureAllowance() => $_ensure(2);
}

