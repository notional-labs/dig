///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/any.pb.dart' as $5;

class MsgGrantAllowance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgGrantAllowance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..aOM<$5.Any>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowance', subBuilder: $5.Any.create)
    ..hasRequiredFields = false
  ;

  MsgGrantAllowance._() : super();
  factory MsgGrantAllowance({
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
  factory MsgGrantAllowance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgGrantAllowance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgGrantAllowance clone() => MsgGrantAllowance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgGrantAllowance copyWith(void Function(MsgGrantAllowance) updates) => super.copyWith((message) => updates(message as MsgGrantAllowance)) as MsgGrantAllowance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgGrantAllowance create() => MsgGrantAllowance._();
  MsgGrantAllowance createEmptyInstance() => create();
  static $pb.PbList<MsgGrantAllowance> createRepeated() => $pb.PbList<MsgGrantAllowance>();
  @$core.pragma('dart2js:noInline')
  static MsgGrantAllowance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgGrantAllowance>(create);
  static MsgGrantAllowance? _defaultInstance;

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

class MsgGrantAllowanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgGrantAllowanceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgGrantAllowanceResponse._() : super();
  factory MsgGrantAllowanceResponse() => create();
  factory MsgGrantAllowanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgGrantAllowanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgGrantAllowanceResponse clone() => MsgGrantAllowanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgGrantAllowanceResponse copyWith(void Function(MsgGrantAllowanceResponse) updates) => super.copyWith((message) => updates(message as MsgGrantAllowanceResponse)) as MsgGrantAllowanceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgGrantAllowanceResponse create() => MsgGrantAllowanceResponse._();
  MsgGrantAllowanceResponse createEmptyInstance() => create();
  static $pb.PbList<MsgGrantAllowanceResponse> createRepeated() => $pb.PbList<MsgGrantAllowanceResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgGrantAllowanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgGrantAllowanceResponse>(create);
  static MsgGrantAllowanceResponse? _defaultInstance;
}

class MsgRevokeAllowance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRevokeAllowance', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..hasRequiredFields = false
  ;

  MsgRevokeAllowance._() : super();
  factory MsgRevokeAllowance({
    $core.String? granter,
    $core.String? grantee,
  }) {
    final _result = create();
    if (granter != null) {
      _result.granter = granter;
    }
    if (grantee != null) {
      _result.grantee = grantee;
    }
    return _result;
  }
  factory MsgRevokeAllowance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRevokeAllowance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRevokeAllowance clone() => MsgRevokeAllowance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRevokeAllowance copyWith(void Function(MsgRevokeAllowance) updates) => super.copyWith((message) => updates(message as MsgRevokeAllowance)) as MsgRevokeAllowance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRevokeAllowance create() => MsgRevokeAllowance._();
  MsgRevokeAllowance createEmptyInstance() => create();
  static $pb.PbList<MsgRevokeAllowance> createRepeated() => $pb.PbList<MsgRevokeAllowance>();
  @$core.pragma('dart2js:noInline')
  static MsgRevokeAllowance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRevokeAllowance>(create);
  static MsgRevokeAllowance? _defaultInstance;

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
}

class MsgRevokeAllowanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRevokeAllowanceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgRevokeAllowanceResponse._() : super();
  factory MsgRevokeAllowanceResponse() => create();
  factory MsgRevokeAllowanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRevokeAllowanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRevokeAllowanceResponse clone() => MsgRevokeAllowanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRevokeAllowanceResponse copyWith(void Function(MsgRevokeAllowanceResponse) updates) => super.copyWith((message) => updates(message as MsgRevokeAllowanceResponse)) as MsgRevokeAllowanceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRevokeAllowanceResponse create() => MsgRevokeAllowanceResponse._();
  MsgRevokeAllowanceResponse createEmptyInstance() => create();
  static $pb.PbList<MsgRevokeAllowanceResponse> createRepeated() => $pb.PbList<MsgRevokeAllowanceResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgRevokeAllowanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRevokeAllowanceResponse>(create);
  static MsgRevokeAllowanceResponse? _defaultInstance;
}

