///
//  Generated code. Do not modify.
//  source: cosmos/evidence/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/any.pb.dart' as $3;
import '../../base/query/v1beta1/pagination.pb.dart' as $5;

class QueryEvidenceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryEvidenceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.evidence.v1beta1'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidenceHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  QueryEvidenceRequest._() : super();
  factory QueryEvidenceRequest({
    $core.List<$core.int>? evidenceHash,
  }) {
    final _result = create();
    if (evidenceHash != null) {
      _result.evidenceHash = evidenceHash;
    }
    return _result;
  }
  factory QueryEvidenceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryEvidenceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryEvidenceRequest clone() => QueryEvidenceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryEvidenceRequest copyWith(void Function(QueryEvidenceRequest) updates) => super.copyWith((message) => updates(message as QueryEvidenceRequest)) as QueryEvidenceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryEvidenceRequest create() => QueryEvidenceRequest._();
  QueryEvidenceRequest createEmptyInstance() => create();
  static $pb.PbList<QueryEvidenceRequest> createRepeated() => $pb.PbList<QueryEvidenceRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryEvidenceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryEvidenceRequest>(create);
  static QueryEvidenceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get evidenceHash => $_getN(0);
  @$pb.TagNumber(1)
  set evidenceHash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidenceHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidenceHash() => clearField(1);
}

class QueryEvidenceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryEvidenceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.evidence.v1beta1'), createEmptyInstance: create)
    ..aOM<$3.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', subBuilder: $3.Any.create)
    ..hasRequiredFields = false
  ;

  QueryEvidenceResponse._() : super();
  factory QueryEvidenceResponse({
    $3.Any? evidence,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence = evidence;
    }
    return _result;
  }
  factory QueryEvidenceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryEvidenceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryEvidenceResponse clone() => QueryEvidenceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryEvidenceResponse copyWith(void Function(QueryEvidenceResponse) updates) => super.copyWith((message) => updates(message as QueryEvidenceResponse)) as QueryEvidenceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryEvidenceResponse create() => QueryEvidenceResponse._();
  QueryEvidenceResponse createEmptyInstance() => create();
  static $pb.PbList<QueryEvidenceResponse> createRepeated() => $pb.PbList<QueryEvidenceResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryEvidenceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryEvidenceResponse>(create);
  static QueryEvidenceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Any get evidence => $_getN(0);
  @$pb.TagNumber(1)
  set evidence($3.Any v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvidence() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidence() => clearField(1);
  @$pb.TagNumber(1)
  $3.Any ensureEvidence() => $_ensure(0);
}

class QueryAllEvidenceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllEvidenceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.evidence.v1beta1'), createEmptyInstance: create)
    ..aOM<$5.PageRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $5.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryAllEvidenceRequest._() : super();
  factory QueryAllEvidenceRequest({
    $5.PageRequest? pagination,
  }) {
    final _result = create();
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryAllEvidenceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllEvidenceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllEvidenceRequest clone() => QueryAllEvidenceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllEvidenceRequest copyWith(void Function(QueryAllEvidenceRequest) updates) => super.copyWith((message) => updates(message as QueryAllEvidenceRequest)) as QueryAllEvidenceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllEvidenceRequest create() => QueryAllEvidenceRequest._();
  QueryAllEvidenceRequest createEmptyInstance() => create();
  static $pb.PbList<QueryAllEvidenceRequest> createRepeated() => $pb.PbList<QueryAllEvidenceRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryAllEvidenceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllEvidenceRequest>(create);
  static QueryAllEvidenceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $5.PageRequest get pagination => $_getN(0);
  @$pb.TagNumber(1)
  set pagination($5.PageRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPagination() => $_has(0);
  @$pb.TagNumber(1)
  void clearPagination() => clearField(1);
  @$pb.TagNumber(1)
  $5.PageRequest ensurePagination() => $_ensure(0);
}

class QueryAllEvidenceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllEvidenceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.evidence.v1beta1'), createEmptyInstance: create)
    ..pc<$3.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'evidence', $pb.PbFieldType.PM, subBuilder: $3.Any.create)
    ..aOM<$5.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $5.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryAllEvidenceResponse._() : super();
  factory QueryAllEvidenceResponse({
    $core.Iterable<$3.Any>? evidence,
    $5.PageResponse? pagination,
  }) {
    final _result = create();
    if (evidence != null) {
      _result.evidence.addAll(evidence);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryAllEvidenceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllEvidenceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllEvidenceResponse clone() => QueryAllEvidenceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllEvidenceResponse copyWith(void Function(QueryAllEvidenceResponse) updates) => super.copyWith((message) => updates(message as QueryAllEvidenceResponse)) as QueryAllEvidenceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllEvidenceResponse create() => QueryAllEvidenceResponse._();
  QueryAllEvidenceResponse createEmptyInstance() => create();
  static $pb.PbList<QueryAllEvidenceResponse> createRepeated() => $pb.PbList<QueryAllEvidenceResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryAllEvidenceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllEvidenceResponse>(create);
  static QueryAllEvidenceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Any> get evidence => $_getList(0);

  @$pb.TagNumber(2)
  $5.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($5.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $5.PageResponse ensurePagination() => $_ensure(1);
}

