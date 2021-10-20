///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $1;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$grantAllowance =
      $grpc.ClientMethod<$1.MsgGrantAllowance, $1.MsgGrantAllowanceResponse>(
          '/cosmos.feegrant.v1beta1.Msg/GrantAllowance',
          ($1.MsgGrantAllowance value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MsgGrantAllowanceResponse.fromBuffer(value));
  static final _$revokeAllowance =
      $grpc.ClientMethod<$1.MsgRevokeAllowance, $1.MsgRevokeAllowanceResponse>(
          '/cosmos.feegrant.v1beta1.Msg/RevokeAllowance',
          ($1.MsgRevokeAllowance value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MsgRevokeAllowanceResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.MsgGrantAllowanceResponse> grantAllowance(
      $1.MsgGrantAllowance request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$grantAllowance, request, options: options);
  }

  $grpc.ResponseFuture<$1.MsgRevokeAllowanceResponse> revokeAllowance(
      $1.MsgRevokeAllowance request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$revokeAllowance, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'cosmos.feegrant.v1beta1.Msg';

  MsgServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$1.MsgGrantAllowance, $1.MsgGrantAllowanceResponse>(
            'GrantAllowance',
            grantAllowance_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.MsgGrantAllowance.fromBuffer(value),
            ($1.MsgGrantAllowanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MsgRevokeAllowance,
            $1.MsgRevokeAllowanceResponse>(
        'RevokeAllowance',
        revokeAllowance_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.MsgRevokeAllowance.fromBuffer(value),
        ($1.MsgRevokeAllowanceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.MsgGrantAllowanceResponse> grantAllowance_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.MsgGrantAllowance> request) async {
    return grantAllowance(call, await request);
  }

  $async.Future<$1.MsgRevokeAllowanceResponse> revokeAllowance_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.MsgRevokeAllowance> request) async {
    return revokeAllowance(call, await request);
  }

  $async.Future<$1.MsgGrantAllowanceResponse> grantAllowance(
      $grpc.ServiceCall call, $1.MsgGrantAllowance request);
  $async.Future<$1.MsgRevokeAllowanceResponse> revokeAllowance(
      $grpc.ServiceCall call, $1.MsgRevokeAllowance request);
}
