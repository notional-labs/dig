///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'authz.pb.dart' as $7;
import '../../../google/protobuf/any.pb.dart' as $3;

class MsgGrant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgGrant', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..aOM<$7.Grant>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grant', subBuilder: $7.Grant.create)
    ..hasRequiredFields = false
  ;

  MsgGrant._() : super();
  factory MsgGrant({
    $core.String? granter,
    $core.String? grantee,
    $7.Grant? grant,
  }) {
    final _result = create();
    if (granter != null) {
      _result.granter = granter;
    }
    if (grantee != null) {
      _result.grantee = grantee;
    }
    if (grant != null) {
      _result.grant = grant;
    }
    return _result;
  }
  factory MsgGrant.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgGrant.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgGrant clone() => MsgGrant()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgGrant copyWith(void Function(MsgGrant) updates) => super.copyWith((message) => updates(message as MsgGrant)) as MsgGrant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgGrant create() => MsgGrant._();
  MsgGrant createEmptyInstance() => create();
  static $pb.PbList<MsgGrant> createRepeated() => $pb.PbList<MsgGrant>();
  @$core.pragma('dart2js:noInline')
  static MsgGrant getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgGrant>(create);
  static MsgGrant? _defaultInstance;

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
  $7.Grant get grant => $_getN(2);
  @$pb.TagNumber(3)
  set grant($7.Grant v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGrant() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrant() => clearField(3);
  @$pb.TagNumber(3)
  $7.Grant ensureGrant() => $_ensure(2);
}

class MsgExecResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgExecResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'results', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  MsgExecResponse._() : super();
  factory MsgExecResponse({
    $core.Iterable<$core.List<$core.int>>? results,
  }) {
    final _result = create();
    if (results != null) {
      _result.results.addAll(results);
    }
    return _result;
  }
  factory MsgExecResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgExecResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgExecResponse clone() => MsgExecResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgExecResponse copyWith(void Function(MsgExecResponse) updates) => super.copyWith((message) => updates(message as MsgExecResponse)) as MsgExecResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgExecResponse create() => MsgExecResponse._();
  MsgExecResponse createEmptyInstance() => create();
  static $pb.PbList<MsgExecResponse> createRepeated() => $pb.PbList<MsgExecResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgExecResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgExecResponse>(create);
  static MsgExecResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get results => $_getList(0);
}

class MsgExec extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgExec', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..pc<$3.Any>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msgs', $pb.PbFieldType.PM, subBuilder: $3.Any.create)
    ..hasRequiredFields = false
  ;

  MsgExec._() : super();
  factory MsgExec({
    $core.String? grantee,
    $core.Iterable<$3.Any>? msgs,
  }) {
    final _result = create();
    if (grantee != null) {
      _result.grantee = grantee;
    }
    if (msgs != null) {
      _result.msgs.addAll(msgs);
    }
    return _result;
  }
  factory MsgExec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgExec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgExec clone() => MsgExec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgExec copyWith(void Function(MsgExec) updates) => super.copyWith((message) => updates(message as MsgExec)) as MsgExec; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgExec create() => MsgExec._();
  MsgExec createEmptyInstance() => create();
  static $pb.PbList<MsgExec> createRepeated() => $pb.PbList<MsgExec>();
  @$core.pragma('dart2js:noInline')
  static MsgExec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgExec>(create);
  static MsgExec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get grantee => $_getSZ(0);
  @$pb.TagNumber(1)
  set grantee($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGrantee() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrantee() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$3.Any> get msgs => $_getList(1);
}

class MsgGrantResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgGrantResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgGrantResponse._() : super();
  factory MsgGrantResponse() => create();
  factory MsgGrantResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgGrantResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgGrantResponse clone() => MsgGrantResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgGrantResponse copyWith(void Function(MsgGrantResponse) updates) => super.copyWith((message) => updates(message as MsgGrantResponse)) as MsgGrantResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgGrantResponse create() => MsgGrantResponse._();
  MsgGrantResponse createEmptyInstance() => create();
  static $pb.PbList<MsgGrantResponse> createRepeated() => $pb.PbList<MsgGrantResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgGrantResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgGrantResponse>(create);
  static MsgGrantResponse? _defaultInstance;
}

class MsgRevoke extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRevoke', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msgTypeUrl')
    ..hasRequiredFields = false
  ;

  MsgRevoke._() : super();
  factory MsgRevoke({
    $core.String? granter,
    $core.String? grantee,
    $core.String? msgTypeUrl,
  }) {
    final _result = create();
    if (granter != null) {
      _result.granter = granter;
    }
    if (grantee != null) {
      _result.grantee = grantee;
    }
    if (msgTypeUrl != null) {
      _result.msgTypeUrl = msgTypeUrl;
    }
    return _result;
  }
  factory MsgRevoke.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRevoke.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRevoke clone() => MsgRevoke()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRevoke copyWith(void Function(MsgRevoke) updates) => super.copyWith((message) => updates(message as MsgRevoke)) as MsgRevoke; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRevoke create() => MsgRevoke._();
  MsgRevoke createEmptyInstance() => create();
  static $pb.PbList<MsgRevoke> createRepeated() => $pb.PbList<MsgRevoke>();
  @$core.pragma('dart2js:noInline')
  static MsgRevoke getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRevoke>(create);
  static MsgRevoke? _defaultInstance;

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
  $core.String get msgTypeUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set msgTypeUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsgTypeUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgTypeUrl() => clearField(3);
}

class MsgRevokeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRevokeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgRevokeResponse._() : super();
  factory MsgRevokeResponse() => create();
  factory MsgRevokeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRevokeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRevokeResponse clone() => MsgRevokeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRevokeResponse copyWith(void Function(MsgRevokeResponse) updates) => super.copyWith((message) => updates(message as MsgRevokeResponse)) as MsgRevokeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRevokeResponse create() => MsgRevokeResponse._();
  MsgRevokeResponse createEmptyInstance() => create();
  static $pb.PbList<MsgRevokeResponse> createRepeated() => $pb.PbList<MsgRevokeResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgRevokeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRevokeResponse>(create);
  static MsgRevokeResponse? _defaultInstance;
}

