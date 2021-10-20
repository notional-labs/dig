///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $2;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$grant = $grpc.ClientMethod<$2.MsgGrant, $2.MsgGrantResponse>(
      '/cosmos.authz.v1beta1.Msg/Grant',
      ($2.MsgGrant value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.MsgGrantResponse.fromBuffer(value));
  static final _$exec = $grpc.ClientMethod<$2.MsgExec, $2.MsgExecResponse>(
      '/cosmos.authz.v1beta1.Msg/Exec',
      ($2.MsgExec value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.MsgExecResponse.fromBuffer(value));
  static final _$revoke =
      $grpc.ClientMethod<$2.MsgRevoke, $2.MsgRevokeResponse>(
          '/cosmos.authz.v1beta1.Msg/Revoke',
          ($2.MsgRevoke value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.MsgRevokeResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.MsgGrantResponse> grant($2.MsgGrant request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$grant, request, options: options);
  }

  $grpc.ResponseFuture<$2.MsgExecResponse> exec($2.MsgExec request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$exec, request, options: options);
  }

  $grpc.ResponseFuture<$2.MsgRevokeResponse> revoke($2.MsgRevoke request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$revoke, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'cosmos.authz.v1beta1.Msg';

  MsgServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.MsgGrant, $2.MsgGrantResponse>(
        'Grant',
        grant_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.MsgGrant.fromBuffer(value),
        ($2.MsgGrantResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.MsgExec, $2.MsgExecResponse>(
        'Exec',
        exec_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.MsgExec.fromBuffer(value),
        ($2.MsgExecResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.MsgRevoke, $2.MsgRevokeResponse>(
        'Revoke',
        revoke_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.MsgRevoke.fromBuffer(value),
        ($2.MsgRevokeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.MsgGrantResponse> grant_Pre(
      $grpc.ServiceCall call, $async.Future<$2.MsgGrant> request) async {
    return grant(call, await request);
  }

  $async.Future<$2.MsgExecResponse> exec_Pre(
      $grpc.ServiceCall call, $async.Future<$2.MsgExec> request) async {
    return exec(call, await request);
  }

  $async.Future<$2.MsgRevokeResponse> revoke_Pre(
      $grpc.ServiceCall call, $async.Future<$2.MsgRevoke> request) async {
    return revoke(call, await request);
  }

  $async.Future<$2.MsgGrantResponse> grant(
      $grpc.ServiceCall call, $2.MsgGrant request);
  $async.Future<$2.MsgExecResponse> exec(
      $grpc.ServiceCall call, $2.MsgExec request);
  $async.Future<$2.MsgRevokeResponse> revoke(
      $grpc.ServiceCall call, $2.MsgRevoke request);
}
