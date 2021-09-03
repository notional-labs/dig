///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/query.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../base/query/v1beta1/pagination.pb.dart' as $6;
import 'authz.pb.dart' as $7;

class QueryGrantsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGrantsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msgTypeUrl')
    ..aOM<$6.PageRequest>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $6.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryGrantsRequest._() : super();
  factory QueryGrantsRequest() => create();
  factory QueryGrantsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGrantsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGrantsRequest clone() => QueryGrantsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGrantsRequest copyWith(void Function(QueryGrantsRequest) updates) => super.copyWith((message) => updates(message as QueryGrantsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGrantsRequest create() => QueryGrantsRequest._();
  QueryGrantsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGrantsRequest> createRepeated() => $pb.PbList<QueryGrantsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGrantsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGrantsRequest>(create);
  static QueryGrantsRequest _defaultInstance;

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

  @$pb.TagNumber(4)
  $6.PageRequest get pagination => $_getN(3);
  @$pb.TagNumber(4)
  set pagination($6.PageRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPagination() => $_has(3);
  @$pb.TagNumber(4)
  void clearPagination() => clearField(4);
  @$pb.TagNumber(4)
  $6.PageRequest ensurePagination() => $_ensure(3);
}

class QueryGrantsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGrantsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.authz.v1beta1'), createEmptyInstance: create)
    ..pc<$7.Grant>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grants', $pb.PbFieldType.PM, subBuilder: $7.Grant.create)
    ..aOM<$6.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $6.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryGrantsResponse._() : super();
  factory QueryGrantsResponse() => create();
  factory QueryGrantsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGrantsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGrantsResponse clone() => QueryGrantsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGrantsResponse copyWith(void Function(QueryGrantsResponse) updates) => super.copyWith((message) => updates(message as QueryGrantsResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGrantsResponse create() => QueryGrantsResponse._();
  QueryGrantsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGrantsResponse> createRepeated() => $pb.PbList<QueryGrantsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGrantsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGrantsResponse>(create);
  static QueryGrantsResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$7.Grant> get grants => $_getList(0);

  @$pb.TagNumber(2)
  $6.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($6.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $6.PageResponse ensurePagination() => $_ensure(1);
}

