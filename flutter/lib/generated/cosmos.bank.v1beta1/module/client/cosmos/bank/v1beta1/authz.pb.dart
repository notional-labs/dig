///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/authz.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../base/v1beta1/coin.pb.dart' as $2;

class SendAuthorization extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendAuthorization', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.bank.v1beta1'), createEmptyInstance: create)
    ..pc<$2.Coin>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spendLimit', $pb.PbFieldType.PM, subBuilder: $2.Coin.create)
    ..hasRequiredFields = false
  ;

  SendAuthorization._() : super();
  factory SendAuthorization({
    $core.Iterable<$2.Coin>? spendLimit,
  }) {
    final _result = create();
    if (spendLimit != null) {
      _result.spendLimit.addAll(spendLimit);
    }
    return _result;
  }
  factory SendAuthorization.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendAuthorization.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendAuthorization clone() => SendAuthorization()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendAuthorization copyWith(void Function(SendAuthorization) updates) => super.copyWith((message) => updates(message as SendAuthorization)) as SendAuthorization; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendAuthorization create() => SendAuthorization._();
  SendAuthorization createEmptyInstance() => create();
  static $pb.PbList<SendAuthorization> createRepeated() => $pb.PbList<SendAuthorization>();
  @$core.pragma('dart2js:noInline')
  static SendAuthorization getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendAuthorization>(create);
  static SendAuthorization? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Coin> get spendLimit => $_getList(0);
}

