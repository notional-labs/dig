///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../base/v1beta1/coin.pb.dart' as $2;
import 'bank.pb.dart' as $3;

class MsgSend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSend', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.bank.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromAddress')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toAddress')
    ..pc<$2.Coin>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.PM, subBuilder: $2.Coin.create)
    ..hasRequiredFields = false
  ;

  MsgSend._() : super();
  factory MsgSend({
    $core.String? fromAddress,
    $core.String? toAddress,
    $core.Iterable<$2.Coin>? amount,
  }) {
    final _result = create();
    if (fromAddress != null) {
      _result.fromAddress = fromAddress;
    }
    if (toAddress != null) {
      _result.toAddress = toAddress;
    }
    if (amount != null) {
      _result.amount.addAll(amount);
    }
    return _result;
  }
  factory MsgSend.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSend.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSend clone() => MsgSend()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSend copyWith(void Function(MsgSend) updates) => super.copyWith((message) => updates(message as MsgSend)) as MsgSend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSend create() => MsgSend._();
  MsgSend createEmptyInstance() => create();
  static $pb.PbList<MsgSend> createRepeated() => $pb.PbList<MsgSend>();
  @$core.pragma('dart2js:noInline')
  static MsgSend getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSend>(create);
  static MsgSend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get toAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set toAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$2.Coin> get amount => $_getList(2);
}

class MsgSendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSendResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.bank.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgSendResponse._() : super();
  factory MsgSendResponse() => create();
  factory MsgSendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSendResponse clone() => MsgSendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSendResponse copyWith(void Function(MsgSendResponse) updates) => super.copyWith((message) => updates(message as MsgSendResponse)) as MsgSendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSendResponse create() => MsgSendResponse._();
  MsgSendResponse createEmptyInstance() => create();
  static $pb.PbList<MsgSendResponse> createRepeated() => $pb.PbList<MsgSendResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgSendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSendResponse>(create);
  static MsgSendResponse? _defaultInstance;
}

class MsgMultiSend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgMultiSend', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.bank.v1beta1'), createEmptyInstance: create)
    ..pc<$3.Input>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inputs', $pb.PbFieldType.PM, subBuilder: $3.Input.create)
    ..pc<$3.Output>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'outputs', $pb.PbFieldType.PM, subBuilder: $3.Output.create)
    ..hasRequiredFields = false
  ;

  MsgMultiSend._() : super();
  factory MsgMultiSend({
    $core.Iterable<$3.Input>? inputs,
    $core.Iterable<$3.Output>? outputs,
  }) {
    final _result = create();
    if (inputs != null) {
      _result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      _result.outputs.addAll(outputs);
    }
    return _result;
  }
  factory MsgMultiSend.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgMultiSend.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgMultiSend clone() => MsgMultiSend()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgMultiSend copyWith(void Function(MsgMultiSend) updates) => super.copyWith((message) => updates(message as MsgMultiSend)) as MsgMultiSend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgMultiSend create() => MsgMultiSend._();
  MsgMultiSend createEmptyInstance() => create();
  static $pb.PbList<MsgMultiSend> createRepeated() => $pb.PbList<MsgMultiSend>();
  @$core.pragma('dart2js:noInline')
  static MsgMultiSend getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgMultiSend>(create);
  static MsgMultiSend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Input> get inputs => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$3.Output> get outputs => $_getList(1);
}

class MsgMultiSendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgMultiSendResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.bank.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgMultiSendResponse._() : super();
  factory MsgMultiSendResponse() => create();
  factory MsgMultiSendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgMultiSendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgMultiSendResponse clone() => MsgMultiSendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgMultiSendResponse copyWith(void Function(MsgMultiSendResponse) updates) => super.copyWith((message) => updates(message as MsgMultiSendResponse)) as MsgMultiSendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgMultiSendResponse create() => MsgMultiSendResponse._();
  MsgMultiSendResponse createEmptyInstance() => create();
  static $pb.PbList<MsgMultiSendResponse> createRepeated() => $pb.PbList<MsgMultiSendResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgMultiSendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgMultiSendResponse>(create);
  static MsgMultiSendResponse? _defaultInstance;
}

