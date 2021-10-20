///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EventGrant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventGrant', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msgTypeUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..hasRequiredFields = false
  ;

  EventGrant._() : super();
  factory EventGrant({
    $core.String? msgTypeUrl,
    $core.String? granter,
    $core.String? grantee,
  }) {
    final _result = create();
    if (msgTypeUrl != null) {
      _result.msgTypeUrl = msgTypeUrl;
    }
    if (granter != null) {
      _result.granter = granter;
    }
    if (grantee != null) {
      _result.grantee = grantee;
    }
    return _result;
  }
  factory EventGrant.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventGrant.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventGrant clone() => EventGrant()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventGrant copyWith(void Function(EventGrant) updates) => super.copyWith((message) => updates(message as EventGrant)) as EventGrant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventGrant create() => EventGrant._();
  EventGrant createEmptyInstance() => create();
  static $pb.PbList<EventGrant> createRepeated() => $pb.PbList<EventGrant>();
  @$core.pragma('dart2js:noInline')
  static EventGrant getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventGrant>(create);
  static EventGrant? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get msgTypeUrl => $_getSZ(0);
  @$pb.TagNumber(2)
  set msgTypeUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsgTypeUrl() => $_has(0);
  @$pb.TagNumber(2)
  void clearMsgTypeUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get granter => $_getSZ(1);
  @$pb.TagNumber(3)
  set granter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasGranter() => $_has(1);
  @$pb.TagNumber(3)
  void clearGranter() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get grantee => $_getSZ(2);
  @$pb.TagNumber(4)
  set grantee($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasGrantee() => $_has(2);
  @$pb.TagNumber(4)
  void clearGrantee() => clearField(4);
}

class EventRevoke extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventRevoke', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msgTypeUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..hasRequiredFields = false
  ;

  EventRevoke._() : super();
  factory EventRevoke({
    $core.String? msgTypeUrl,
    $core.String? granter,
    $core.String? grantee,
  }) {
    final _result = create();
    if (msgTypeUrl != null) {
      _result.msgTypeUrl = msgTypeUrl;
    }
    if (granter != null) {
      _result.granter = granter;
    }
    if (grantee != null) {
      _result.grantee = grantee;
    }
    return _result;
  }
  factory EventRevoke.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventRevoke.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventRevoke clone() => EventRevoke()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventRevoke copyWith(void Function(EventRevoke) updates) => super.copyWith((message) => updates(message as EventRevoke)) as EventRevoke; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventRevoke create() => EventRevoke._();
  EventRevoke createEmptyInstance() => create();
  static $pb.PbList<EventRevoke> createRepeated() => $pb.PbList<EventRevoke>();
  @$core.pragma('dart2js:noInline')
  static EventRevoke getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventRevoke>(create);
  static EventRevoke? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get msgTypeUrl => $_getSZ(0);
  @$pb.TagNumber(2)
  set msgTypeUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsgTypeUrl() => $_has(0);
  @$pb.TagNumber(2)
  void clearMsgTypeUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get granter => $_getSZ(1);
  @$pb.TagNumber(3)
  set granter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasGranter() => $_has(1);
  @$pb.TagNumber(3)
  void clearGranter() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get grantee => $_getSZ(2);
  @$pb.TagNumber(4)
  set grantee($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasGrantee() => $_has(2);
  @$pb.TagNumber(4)
  void clearGrantee() => clearField(4);
}

