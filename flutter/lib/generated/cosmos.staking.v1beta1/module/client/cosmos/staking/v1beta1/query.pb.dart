///
//  Generated code. Do not modify.
//  source: cosmos/staking/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../base/query/v1beta1/pagination.pb.dart' as $13;
import 'staking.pb.dart' as $11;

class QueryValidatorsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOM<$13.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryValidatorsRequest._() : super();
  factory QueryValidatorsRequest({
    $core.String? status,
    $13.PageRequest? pagination,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryValidatorsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorsRequest clone() => QueryValidatorsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorsRequest copyWith(void Function(QueryValidatorsRequest) updates) => super.copyWith((message) => updates(message as QueryValidatorsRequest)) as QueryValidatorsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorsRequest create() => QueryValidatorsRequest._();
  QueryValidatorsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorsRequest> createRepeated() => $pb.PbList<QueryValidatorsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorsRequest>(create);
  static QueryValidatorsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $13.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageRequest ensurePagination() => $_ensure(1);
}

class QueryValidatorsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pc<$11.Validator>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validators', $pb.PbFieldType.PM, subBuilder: $11.Validator.create)
    ..aOM<$13.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryValidatorsResponse._() : super();
  factory QueryValidatorsResponse({
    $core.Iterable<$11.Validator>? validators,
    $13.PageResponse? pagination,
  }) {
    final _result = create();
    if (validators != null) {
      _result.validators.addAll(validators);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryValidatorsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorsResponse clone() => QueryValidatorsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorsResponse copyWith(void Function(QueryValidatorsResponse) updates) => super.copyWith((message) => updates(message as QueryValidatorsResponse)) as QueryValidatorsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorsResponse create() => QueryValidatorsResponse._();
  QueryValidatorsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorsResponse> createRepeated() => $pb.PbList<QueryValidatorsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorsResponse>(create);
  static QueryValidatorsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.Validator> get validators => $_getList(0);

  @$pb.TagNumber(2)
  $13.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageResponse ensurePagination() => $_ensure(1);
}

class QueryValidatorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddr')
    ..hasRequiredFields = false
  ;

  QueryValidatorRequest._() : super();
  factory QueryValidatorRequest({
    $core.String? validatorAddr,
  }) {
    final _result = create();
    if (validatorAddr != null) {
      _result.validatorAddr = validatorAddr;
    }
    return _result;
  }
  factory QueryValidatorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorRequest clone() => QueryValidatorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorRequest copyWith(void Function(QueryValidatorRequest) updates) => super.copyWith((message) => updates(message as QueryValidatorRequest)) as QueryValidatorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorRequest create() => QueryValidatorRequest._();
  QueryValidatorRequest createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorRequest> createRepeated() => $pb.PbList<QueryValidatorRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorRequest>(create);
  static QueryValidatorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get validatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddr() => clearField(1);
}

class QueryValidatorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$11.Validator>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validator', subBuilder: $11.Validator.create)
    ..hasRequiredFields = false
  ;

  QueryValidatorResponse._() : super();
  factory QueryValidatorResponse({
    $11.Validator? validator,
  }) {
    final _result = create();
    if (validator != null) {
      _result.validator = validator;
    }
    return _result;
  }
  factory QueryValidatorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorResponse clone() => QueryValidatorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorResponse copyWith(void Function(QueryValidatorResponse) updates) => super.copyWith((message) => updates(message as QueryValidatorResponse)) as QueryValidatorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorResponse create() => QueryValidatorResponse._();
  QueryValidatorResponse createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorResponse> createRepeated() => $pb.PbList<QueryValidatorResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorResponse>(create);
  static QueryValidatorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.Validator get validator => $_getN(0);
  @$pb.TagNumber(1)
  set validator($11.Validator v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidator() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidator() => clearField(1);
  @$pb.TagNumber(1)
  $11.Validator ensureValidator() => $_ensure(0);
}

class QueryValidatorDelegationsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorDelegationsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddr')
    ..aOM<$13.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryValidatorDelegationsRequest._() : super();
  factory QueryValidatorDelegationsRequest({
    $core.String? validatorAddr,
    $13.PageRequest? pagination,
  }) {
    final _result = create();
    if (validatorAddr != null) {
      _result.validatorAddr = validatorAddr;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryValidatorDelegationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorDelegationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorDelegationsRequest clone() => QueryValidatorDelegationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorDelegationsRequest copyWith(void Function(QueryValidatorDelegationsRequest) updates) => super.copyWith((message) => updates(message as QueryValidatorDelegationsRequest)) as QueryValidatorDelegationsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorDelegationsRequest create() => QueryValidatorDelegationsRequest._();
  QueryValidatorDelegationsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorDelegationsRequest> createRepeated() => $pb.PbList<QueryValidatorDelegationsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorDelegationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorDelegationsRequest>(create);
  static QueryValidatorDelegationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get validatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $13.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageRequest ensurePagination() => $_ensure(1);
}

class QueryValidatorDelegationsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorDelegationsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pc<$11.DelegationResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegationResponses', $pb.PbFieldType.PM, subBuilder: $11.DelegationResponse.create)
    ..aOM<$13.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryValidatorDelegationsResponse._() : super();
  factory QueryValidatorDelegationsResponse({
    $core.Iterable<$11.DelegationResponse>? delegationResponses,
    $13.PageResponse? pagination,
  }) {
    final _result = create();
    if (delegationResponses != null) {
      _result.delegationResponses.addAll(delegationResponses);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryValidatorDelegationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorDelegationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorDelegationsResponse clone() => QueryValidatorDelegationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorDelegationsResponse copyWith(void Function(QueryValidatorDelegationsResponse) updates) => super.copyWith((message) => updates(message as QueryValidatorDelegationsResponse)) as QueryValidatorDelegationsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorDelegationsResponse create() => QueryValidatorDelegationsResponse._();
  QueryValidatorDelegationsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorDelegationsResponse> createRepeated() => $pb.PbList<QueryValidatorDelegationsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorDelegationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorDelegationsResponse>(create);
  static QueryValidatorDelegationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.DelegationResponse> get delegationResponses => $_getList(0);

  @$pb.TagNumber(2)
  $13.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageResponse ensurePagination() => $_ensure(1);
}

class QueryValidatorUnbondingDelegationsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorUnbondingDelegationsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddr')
    ..aOM<$13.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryValidatorUnbondingDelegationsRequest._() : super();
  factory QueryValidatorUnbondingDelegationsRequest({
    $core.String? validatorAddr,
    $13.PageRequest? pagination,
  }) {
    final _result = create();
    if (validatorAddr != null) {
      _result.validatorAddr = validatorAddr;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryValidatorUnbondingDelegationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorUnbondingDelegationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorUnbondingDelegationsRequest clone() => QueryValidatorUnbondingDelegationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorUnbondingDelegationsRequest copyWith(void Function(QueryValidatorUnbondingDelegationsRequest) updates) => super.copyWith((message) => updates(message as QueryValidatorUnbondingDelegationsRequest)) as QueryValidatorUnbondingDelegationsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorUnbondingDelegationsRequest create() => QueryValidatorUnbondingDelegationsRequest._();
  QueryValidatorUnbondingDelegationsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorUnbondingDelegationsRequest> createRepeated() => $pb.PbList<QueryValidatorUnbondingDelegationsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorUnbondingDelegationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorUnbondingDelegationsRequest>(create);
  static QueryValidatorUnbondingDelegationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get validatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set validatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $13.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageRequest ensurePagination() => $_ensure(1);
}

class QueryValidatorUnbondingDelegationsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryValidatorUnbondingDelegationsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pc<$11.UnbondingDelegation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unbondingResponses', $pb.PbFieldType.PM, subBuilder: $11.UnbondingDelegation.create)
    ..aOM<$13.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryValidatorUnbondingDelegationsResponse._() : super();
  factory QueryValidatorUnbondingDelegationsResponse({
    $core.Iterable<$11.UnbondingDelegation>? unbondingResponses,
    $13.PageResponse? pagination,
  }) {
    final _result = create();
    if (unbondingResponses != null) {
      _result.unbondingResponses.addAll(unbondingResponses);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryValidatorUnbondingDelegationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryValidatorUnbondingDelegationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryValidatorUnbondingDelegationsResponse clone() => QueryValidatorUnbondingDelegationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryValidatorUnbondingDelegationsResponse copyWith(void Function(QueryValidatorUnbondingDelegationsResponse) updates) => super.copyWith((message) => updates(message as QueryValidatorUnbondingDelegationsResponse)) as QueryValidatorUnbondingDelegationsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryValidatorUnbondingDelegationsResponse create() => QueryValidatorUnbondingDelegationsResponse._();
  QueryValidatorUnbondingDelegationsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryValidatorUnbondingDelegationsResponse> createRepeated() => $pb.PbList<QueryValidatorUnbondingDelegationsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryValidatorUnbondingDelegationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryValidatorUnbondingDelegationsResponse>(create);
  static QueryValidatorUnbondingDelegationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.UnbondingDelegation> get unbondingResponses => $_getList(0);

  @$pb.TagNumber(2)
  $13.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageResponse ensurePagination() => $_ensure(1);
}

class QueryDelegationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegatorAddr')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddr')
    ..hasRequiredFields = false
  ;

  QueryDelegationRequest._() : super();
  factory QueryDelegationRequest({
    $core.String? delegatorAddr,
    $core.String? validatorAddr,
  }) {
    final _result = create();
    if (delegatorAddr != null) {
      _result.delegatorAddr = delegatorAddr;
    }
    if (validatorAddr != null) {
      _result.validatorAddr = validatorAddr;
    }
    return _result;
  }
  factory QueryDelegationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegationRequest clone() => QueryDelegationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegationRequest copyWith(void Function(QueryDelegationRequest) updates) => super.copyWith((message) => updates(message as QueryDelegationRequest)) as QueryDelegationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegationRequest create() => QueryDelegationRequest._();
  QueryDelegationRequest createEmptyInstance() => create();
  static $pb.PbList<QueryDelegationRequest> createRepeated() => $pb.PbList<QueryDelegationRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegationRequest>(create);
  static QueryDelegationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get delegatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get validatorAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set validatorAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddr() => clearField(2);
}

class QueryDelegationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$11.DelegationResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegationResponse', subBuilder: $11.DelegationResponse.create)
    ..hasRequiredFields = false
  ;

  QueryDelegationResponse._() : super();
  factory QueryDelegationResponse({
    $11.DelegationResponse? delegationResponse,
  }) {
    final _result = create();
    if (delegationResponse != null) {
      _result.delegationResponse = delegationResponse;
    }
    return _result;
  }
  factory QueryDelegationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegationResponse clone() => QueryDelegationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegationResponse copyWith(void Function(QueryDelegationResponse) updates) => super.copyWith((message) => updates(message as QueryDelegationResponse)) as QueryDelegationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegationResponse create() => QueryDelegationResponse._();
  QueryDelegationResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegationResponse> createRepeated() => $pb.PbList<QueryDelegationResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegationResponse>(create);
  static QueryDelegationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.DelegationResponse get delegationResponse => $_getN(0);
  @$pb.TagNumber(1)
  set delegationResponse($11.DelegationResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegationResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegationResponse() => clearField(1);
  @$pb.TagNumber(1)
  $11.DelegationResponse ensureDelegationResponse() => $_ensure(0);
}

class QueryUnbondingDelegationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryUnbondingDelegationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegatorAddr')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddr')
    ..hasRequiredFields = false
  ;

  QueryUnbondingDelegationRequest._() : super();
  factory QueryUnbondingDelegationRequest({
    $core.String? delegatorAddr,
    $core.String? validatorAddr,
  }) {
    final _result = create();
    if (delegatorAddr != null) {
      _result.delegatorAddr = delegatorAddr;
    }
    if (validatorAddr != null) {
      _result.validatorAddr = validatorAddr;
    }
    return _result;
  }
  factory QueryUnbondingDelegationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryUnbondingDelegationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryUnbondingDelegationRequest clone() => QueryUnbondingDelegationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryUnbondingDelegationRequest copyWith(void Function(QueryUnbondingDelegationRequest) updates) => super.copyWith((message) => updates(message as QueryUnbondingDelegationRequest)) as QueryUnbondingDelegationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryUnbondingDelegationRequest create() => QueryUnbondingDelegationRequest._();
  QueryUnbondingDelegationRequest createEmptyInstance() => create();
  static $pb.PbList<QueryUnbondingDelegationRequest> createRepeated() => $pb.PbList<QueryUnbondingDelegationRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryUnbondingDelegationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryUnbondingDelegationRequest>(create);
  static QueryUnbondingDelegationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get delegatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get validatorAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set validatorAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddr() => clearField(2);
}

class QueryUnbondingDelegationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryUnbondingDelegationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$11.UnbondingDelegation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unbond', subBuilder: $11.UnbondingDelegation.create)
    ..hasRequiredFields = false
  ;

  QueryUnbondingDelegationResponse._() : super();
  factory QueryUnbondingDelegationResponse({
    $11.UnbondingDelegation? unbond,
  }) {
    final _result = create();
    if (unbond != null) {
      _result.unbond = unbond;
    }
    return _result;
  }
  factory QueryUnbondingDelegationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryUnbondingDelegationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryUnbondingDelegationResponse clone() => QueryUnbondingDelegationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryUnbondingDelegationResponse copyWith(void Function(QueryUnbondingDelegationResponse) updates) => super.copyWith((message) => updates(message as QueryUnbondingDelegationResponse)) as QueryUnbondingDelegationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryUnbondingDelegationResponse create() => QueryUnbondingDelegationResponse._();
  QueryUnbondingDelegationResponse createEmptyInstance() => create();
  static $pb.PbList<QueryUnbondingDelegationResponse> createRepeated() => $pb.PbList<QueryUnbondingDelegationResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryUnbondingDelegationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryUnbondingDelegationResponse>(create);
  static QueryUnbondingDelegationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.UnbondingDelegation get unbond => $_getN(0);
  @$pb.TagNumber(1)
  set unbond($11.UnbondingDelegation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnbond() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnbond() => clearField(1);
  @$pb.TagNumber(1)
  $11.UnbondingDelegation ensureUnbond() => $_ensure(0);
}

class QueryDelegatorDelegationsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorDelegationsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegatorAddr')
    ..aOM<$13.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryDelegatorDelegationsRequest._() : super();
  factory QueryDelegatorDelegationsRequest({
    $core.String? delegatorAddr,
    $13.PageRequest? pagination,
  }) {
    final _result = create();
    if (delegatorAddr != null) {
      _result.delegatorAddr = delegatorAddr;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDelegatorDelegationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorDelegationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorDelegationsRequest clone() => QueryDelegatorDelegationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorDelegationsRequest copyWith(void Function(QueryDelegatorDelegationsRequest) updates) => super.copyWith((message) => updates(message as QueryDelegatorDelegationsRequest)) as QueryDelegatorDelegationsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorDelegationsRequest create() => QueryDelegatorDelegationsRequest._();
  QueryDelegatorDelegationsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorDelegationsRequest> createRepeated() => $pb.PbList<QueryDelegatorDelegationsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorDelegationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorDelegationsRequest>(create);
  static QueryDelegatorDelegationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get delegatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $13.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageRequest ensurePagination() => $_ensure(1);
}

class QueryDelegatorDelegationsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorDelegationsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pc<$11.DelegationResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegationResponses', $pb.PbFieldType.PM, subBuilder: $11.DelegationResponse.create)
    ..aOM<$13.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryDelegatorDelegationsResponse._() : super();
  factory QueryDelegatorDelegationsResponse({
    $core.Iterable<$11.DelegationResponse>? delegationResponses,
    $13.PageResponse? pagination,
  }) {
    final _result = create();
    if (delegationResponses != null) {
      _result.delegationResponses.addAll(delegationResponses);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDelegatorDelegationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorDelegationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorDelegationsResponse clone() => QueryDelegatorDelegationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorDelegationsResponse copyWith(void Function(QueryDelegatorDelegationsResponse) updates) => super.copyWith((message) => updates(message as QueryDelegatorDelegationsResponse)) as QueryDelegatorDelegationsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorDelegationsResponse create() => QueryDelegatorDelegationsResponse._();
  QueryDelegatorDelegationsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorDelegationsResponse> createRepeated() => $pb.PbList<QueryDelegatorDelegationsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorDelegationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorDelegationsResponse>(create);
  static QueryDelegatorDelegationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.DelegationResponse> get delegationResponses => $_getList(0);

  @$pb.TagNumber(2)
  $13.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageResponse ensurePagination() => $_ensure(1);
}

class QueryDelegatorUnbondingDelegationsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorUnbondingDelegationsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegatorAddr')
    ..aOM<$13.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryDelegatorUnbondingDelegationsRequest._() : super();
  factory QueryDelegatorUnbondingDelegationsRequest({
    $core.String? delegatorAddr,
    $13.PageRequest? pagination,
  }) {
    final _result = create();
    if (delegatorAddr != null) {
      _result.delegatorAddr = delegatorAddr;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDelegatorUnbondingDelegationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorUnbondingDelegationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorUnbondingDelegationsRequest clone() => QueryDelegatorUnbondingDelegationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorUnbondingDelegationsRequest copyWith(void Function(QueryDelegatorUnbondingDelegationsRequest) updates) => super.copyWith((message) => updates(message as QueryDelegatorUnbondingDelegationsRequest)) as QueryDelegatorUnbondingDelegationsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorUnbondingDelegationsRequest create() => QueryDelegatorUnbondingDelegationsRequest._();
  QueryDelegatorUnbondingDelegationsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorUnbondingDelegationsRequest> createRepeated() => $pb.PbList<QueryDelegatorUnbondingDelegationsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorUnbondingDelegationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorUnbondingDelegationsRequest>(create);
  static QueryDelegatorUnbondingDelegationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get delegatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $13.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageRequest ensurePagination() => $_ensure(1);
}

class QueryDelegatorUnbondingDelegationsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorUnbondingDelegationsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pc<$11.UnbondingDelegation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unbondingResponses', $pb.PbFieldType.PM, subBuilder: $11.UnbondingDelegation.create)
    ..aOM<$13.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryDelegatorUnbondingDelegationsResponse._() : super();
  factory QueryDelegatorUnbondingDelegationsResponse({
    $core.Iterable<$11.UnbondingDelegation>? unbondingResponses,
    $13.PageResponse? pagination,
  }) {
    final _result = create();
    if (unbondingResponses != null) {
      _result.unbondingResponses.addAll(unbondingResponses);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDelegatorUnbondingDelegationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorUnbondingDelegationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorUnbondingDelegationsResponse clone() => QueryDelegatorUnbondingDelegationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorUnbondingDelegationsResponse copyWith(void Function(QueryDelegatorUnbondingDelegationsResponse) updates) => super.copyWith((message) => updates(message as QueryDelegatorUnbondingDelegationsResponse)) as QueryDelegatorUnbondingDelegationsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorUnbondingDelegationsResponse create() => QueryDelegatorUnbondingDelegationsResponse._();
  QueryDelegatorUnbondingDelegationsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorUnbondingDelegationsResponse> createRepeated() => $pb.PbList<QueryDelegatorUnbondingDelegationsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorUnbondingDelegationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorUnbondingDelegationsResponse>(create);
  static QueryDelegatorUnbondingDelegationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.UnbondingDelegation> get unbondingResponses => $_getList(0);

  @$pb.TagNumber(2)
  $13.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageResponse ensurePagination() => $_ensure(1);
}

class QueryRedelegationsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryRedelegationsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegatorAddr')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'srcValidatorAddr')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dstValidatorAddr')
    ..aOM<$13.PageRequest>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryRedelegationsRequest._() : super();
  factory QueryRedelegationsRequest({
    $core.String? delegatorAddr,
    $core.String? srcValidatorAddr,
    $core.String? dstValidatorAddr,
    $13.PageRequest? pagination,
  }) {
    final _result = create();
    if (delegatorAddr != null) {
      _result.delegatorAddr = delegatorAddr;
    }
    if (srcValidatorAddr != null) {
      _result.srcValidatorAddr = srcValidatorAddr;
    }
    if (dstValidatorAddr != null) {
      _result.dstValidatorAddr = dstValidatorAddr;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryRedelegationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryRedelegationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryRedelegationsRequest clone() => QueryRedelegationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryRedelegationsRequest copyWith(void Function(QueryRedelegationsRequest) updates) => super.copyWith((message) => updates(message as QueryRedelegationsRequest)) as QueryRedelegationsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryRedelegationsRequest create() => QueryRedelegationsRequest._();
  QueryRedelegationsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryRedelegationsRequest> createRepeated() => $pb.PbList<QueryRedelegationsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryRedelegationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryRedelegationsRequest>(create);
  static QueryRedelegationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get delegatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get srcValidatorAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set srcValidatorAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSrcValidatorAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearSrcValidatorAddr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dstValidatorAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set dstValidatorAddr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDstValidatorAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearDstValidatorAddr() => clearField(3);

  @$pb.TagNumber(4)
  $13.PageRequest get pagination => $_getN(3);
  @$pb.TagNumber(4)
  set pagination($13.PageRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPagination() => $_has(3);
  @$pb.TagNumber(4)
  void clearPagination() => clearField(4);
  @$pb.TagNumber(4)
  $13.PageRequest ensurePagination() => $_ensure(3);
}

class QueryRedelegationsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryRedelegationsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pc<$11.RedelegationResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'redelegationResponses', $pb.PbFieldType.PM, subBuilder: $11.RedelegationResponse.create)
    ..aOM<$13.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryRedelegationsResponse._() : super();
  factory QueryRedelegationsResponse({
    $core.Iterable<$11.RedelegationResponse>? redelegationResponses,
    $13.PageResponse? pagination,
  }) {
    final _result = create();
    if (redelegationResponses != null) {
      _result.redelegationResponses.addAll(redelegationResponses);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryRedelegationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryRedelegationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryRedelegationsResponse clone() => QueryRedelegationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryRedelegationsResponse copyWith(void Function(QueryRedelegationsResponse) updates) => super.copyWith((message) => updates(message as QueryRedelegationsResponse)) as QueryRedelegationsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryRedelegationsResponse create() => QueryRedelegationsResponse._();
  QueryRedelegationsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryRedelegationsResponse> createRepeated() => $pb.PbList<QueryRedelegationsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryRedelegationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryRedelegationsResponse>(create);
  static QueryRedelegationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.RedelegationResponse> get redelegationResponses => $_getList(0);

  @$pb.TagNumber(2)
  $13.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageResponse ensurePagination() => $_ensure(1);
}

class QueryDelegatorValidatorsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorValidatorsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegatorAddr')
    ..aOM<$13.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryDelegatorValidatorsRequest._() : super();
  factory QueryDelegatorValidatorsRequest({
    $core.String? delegatorAddr,
    $13.PageRequest? pagination,
  }) {
    final _result = create();
    if (delegatorAddr != null) {
      _result.delegatorAddr = delegatorAddr;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDelegatorValidatorsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorValidatorsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorsRequest clone() => QueryDelegatorValidatorsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorsRequest copyWith(void Function(QueryDelegatorValidatorsRequest) updates) => super.copyWith((message) => updates(message as QueryDelegatorValidatorsRequest)) as QueryDelegatorValidatorsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorsRequest create() => QueryDelegatorValidatorsRequest._();
  QueryDelegatorValidatorsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorValidatorsRequest> createRepeated() => $pb.PbList<QueryDelegatorValidatorsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorValidatorsRequest>(create);
  static QueryDelegatorValidatorsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get delegatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $13.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageRequest ensurePagination() => $_ensure(1);
}

class QueryDelegatorValidatorsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorValidatorsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..pc<$11.Validator>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validators', $pb.PbFieldType.PM, subBuilder: $11.Validator.create)
    ..aOM<$13.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $13.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryDelegatorValidatorsResponse._() : super();
  factory QueryDelegatorValidatorsResponse({
    $core.Iterable<$11.Validator>? validators,
    $13.PageResponse? pagination,
  }) {
    final _result = create();
    if (validators != null) {
      _result.validators.addAll(validators);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDelegatorValidatorsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorValidatorsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorsResponse clone() => QueryDelegatorValidatorsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorsResponse copyWith(void Function(QueryDelegatorValidatorsResponse) updates) => super.copyWith((message) => updates(message as QueryDelegatorValidatorsResponse)) as QueryDelegatorValidatorsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorsResponse create() => QueryDelegatorValidatorsResponse._();
  QueryDelegatorValidatorsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorValidatorsResponse> createRepeated() => $pb.PbList<QueryDelegatorValidatorsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorValidatorsResponse>(create);
  static QueryDelegatorValidatorsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$11.Validator> get validators => $_getList(0);

  @$pb.TagNumber(2)
  $13.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($13.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $13.PageResponse ensurePagination() => $_ensure(1);
}

class QueryDelegatorValidatorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorValidatorRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delegatorAddr')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorAddr')
    ..hasRequiredFields = false
  ;

  QueryDelegatorValidatorRequest._() : super();
  factory QueryDelegatorValidatorRequest({
    $core.String? delegatorAddr,
    $core.String? validatorAddr,
  }) {
    final _result = create();
    if (delegatorAddr != null) {
      _result.delegatorAddr = delegatorAddr;
    }
    if (validatorAddr != null) {
      _result.validatorAddr = validatorAddr;
    }
    return _result;
  }
  factory QueryDelegatorValidatorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorValidatorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorRequest clone() => QueryDelegatorValidatorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorRequest copyWith(void Function(QueryDelegatorValidatorRequest) updates) => super.copyWith((message) => updates(message as QueryDelegatorValidatorRequest)) as QueryDelegatorValidatorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorRequest create() => QueryDelegatorValidatorRequest._();
  QueryDelegatorValidatorRequest createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorValidatorRequest> createRepeated() => $pb.PbList<QueryDelegatorValidatorRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorValidatorRequest>(create);
  static QueryDelegatorValidatorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get delegatorAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set delegatorAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDelegatorAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearDelegatorAddr() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get validatorAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set validatorAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValidatorAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidatorAddr() => clearField(2);
}

class QueryDelegatorValidatorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDelegatorValidatorResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$11.Validator>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validator', subBuilder: $11.Validator.create)
    ..hasRequiredFields = false
  ;

  QueryDelegatorValidatorResponse._() : super();
  factory QueryDelegatorValidatorResponse({
    $11.Validator? validator,
  }) {
    final _result = create();
    if (validator != null) {
      _result.validator = validator;
    }
    return _result;
  }
  factory QueryDelegatorValidatorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDelegatorValidatorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorResponse clone() => QueryDelegatorValidatorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDelegatorValidatorResponse copyWith(void Function(QueryDelegatorValidatorResponse) updates) => super.copyWith((message) => updates(message as QueryDelegatorValidatorResponse)) as QueryDelegatorValidatorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorResponse create() => QueryDelegatorValidatorResponse._();
  QueryDelegatorValidatorResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDelegatorValidatorResponse> createRepeated() => $pb.PbList<QueryDelegatorValidatorResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDelegatorValidatorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDelegatorValidatorResponse>(create);
  static QueryDelegatorValidatorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.Validator get validator => $_getN(0);
  @$pb.TagNumber(1)
  set validator($11.Validator v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasValidator() => $_has(0);
  @$pb.TagNumber(1)
  void clearValidator() => clearField(1);
  @$pb.TagNumber(1)
  $11.Validator ensureValidator() => $_ensure(0);
}

class QueryHistoricalInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryHistoricalInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height')
    ..hasRequiredFields = false
  ;

  QueryHistoricalInfoRequest._() : super();
  factory QueryHistoricalInfoRequest({
    $fixnum.Int64? height,
  }) {
    final _result = create();
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory QueryHistoricalInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryHistoricalInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryHistoricalInfoRequest clone() => QueryHistoricalInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryHistoricalInfoRequest copyWith(void Function(QueryHistoricalInfoRequest) updates) => super.copyWith((message) => updates(message as QueryHistoricalInfoRequest)) as QueryHistoricalInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryHistoricalInfoRequest create() => QueryHistoricalInfoRequest._();
  QueryHistoricalInfoRequest createEmptyInstance() => create();
  static $pb.PbList<QueryHistoricalInfoRequest> createRepeated() => $pb.PbList<QueryHistoricalInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryHistoricalInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryHistoricalInfoRequest>(create);
  static QueryHistoricalInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
}

class QueryHistoricalInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryHistoricalInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$11.HistoricalInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hist', subBuilder: $11.HistoricalInfo.create)
    ..hasRequiredFields = false
  ;

  QueryHistoricalInfoResponse._() : super();
  factory QueryHistoricalInfoResponse({
    $11.HistoricalInfo? hist,
  }) {
    final _result = create();
    if (hist != null) {
      _result.hist = hist;
    }
    return _result;
  }
  factory QueryHistoricalInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryHistoricalInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryHistoricalInfoResponse clone() => QueryHistoricalInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryHistoricalInfoResponse copyWith(void Function(QueryHistoricalInfoResponse) updates) => super.copyWith((message) => updates(message as QueryHistoricalInfoResponse)) as QueryHistoricalInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryHistoricalInfoResponse create() => QueryHistoricalInfoResponse._();
  QueryHistoricalInfoResponse createEmptyInstance() => create();
  static $pb.PbList<QueryHistoricalInfoResponse> createRepeated() => $pb.PbList<QueryHistoricalInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryHistoricalInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryHistoricalInfoResponse>(create);
  static QueryHistoricalInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.HistoricalInfo get hist => $_getN(0);
  @$pb.TagNumber(1)
  set hist($11.HistoricalInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHist() => $_has(0);
  @$pb.TagNumber(1)
  void clearHist() => clearField(1);
  @$pb.TagNumber(1)
  $11.HistoricalInfo ensureHist() => $_ensure(0);
}

class QueryPoolRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPoolRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryPoolRequest._() : super();
  factory QueryPoolRequest() => create();
  factory QueryPoolRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPoolRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPoolRequest clone() => QueryPoolRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPoolRequest copyWith(void Function(QueryPoolRequest) updates) => super.copyWith((message) => updates(message as QueryPoolRequest)) as QueryPoolRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPoolRequest create() => QueryPoolRequest._();
  QueryPoolRequest createEmptyInstance() => create();
  static $pb.PbList<QueryPoolRequest> createRepeated() => $pb.PbList<QueryPoolRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryPoolRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPoolRequest>(create);
  static QueryPoolRequest? _defaultInstance;
}

class QueryPoolResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryPoolResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$11.Pool>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pool', subBuilder: $11.Pool.create)
    ..hasRequiredFields = false
  ;

  QueryPoolResponse._() : super();
  factory QueryPoolResponse({
    $11.Pool? pool,
  }) {
    final _result = create();
    if (pool != null) {
      _result.pool = pool;
    }
    return _result;
  }
  factory QueryPoolResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryPoolResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryPoolResponse clone() => QueryPoolResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryPoolResponse copyWith(void Function(QueryPoolResponse) updates) => super.copyWith((message) => updates(message as QueryPoolResponse)) as QueryPoolResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryPoolResponse create() => QueryPoolResponse._();
  QueryPoolResponse createEmptyInstance() => create();
  static $pb.PbList<QueryPoolResponse> createRepeated() => $pb.PbList<QueryPoolResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryPoolResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryPoolResponse>(create);
  static QueryPoolResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.Pool get pool => $_getN(0);
  @$pb.TagNumber(1)
  set pool($11.Pool v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPool() => $_has(0);
  @$pb.TagNumber(1)
  void clearPool() => clearField(1);
  @$pb.TagNumber(1)
  $11.Pool ensurePool() => $_ensure(0);
}

class QueryParamsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryParamsRequest._() : super();
  factory QueryParamsRequest() => create();
  factory QueryParamsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsRequest clone() => QueryParamsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsRequest copyWith(void Function(QueryParamsRequest) updates) => super.copyWith((message) => updates(message as QueryParamsRequest)) as QueryParamsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest create() => QueryParamsRequest._();
  QueryParamsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryParamsRequest> createRepeated() => $pb.PbList<QueryParamsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsRequest>(create);
  static QueryParamsRequest? _defaultInstance;
}

class QueryParamsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$11.Params>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'params', subBuilder: $11.Params.create)
    ..hasRequiredFields = false
  ;

  QueryParamsResponse._() : super();
  factory QueryParamsResponse({
    $11.Params? params,
  }) {
    final _result = create();
    if (params != null) {
      _result.params = params;
    }
    return _result;
  }
  factory QueryParamsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsResponse clone() => QueryParamsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsResponse copyWith(void Function(QueryParamsResponse) updates) => super.copyWith((message) => updates(message as QueryParamsResponse)) as QueryParamsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse create() => QueryParamsResponse._();
  QueryParamsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryParamsResponse> createRepeated() => $pb.PbList<QueryParamsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsResponse>(create);
  static QueryParamsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $11.Params get params => $_getN(0);
  @$pb.TagNumber(1)
  set params($11.Params v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => clearField(1);
  @$pb.TagNumber(1)
  $11.Params ensureParams() => $_ensure(0);
}

