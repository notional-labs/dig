///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/query.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $0;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$grants =
      $grpc.ClientMethod<$0.QueryGrantsRequest, $0.QueryGrantsResponse>(
          '/cosmos.authz.v1beta1.Query/Grants',
          ($0.QueryGrantsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryGrantsResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryGrantsResponse> grants(
      $0.QueryGrantsRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$grants, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'cosmos.authz.v1beta1.Query';

  QueryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.QueryGrantsRequest, $0.QueryGrantsResponse>(
            'Grants',
            grants_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryGrantsRequest.fromBuffer(value),
            ($0.QueryGrantsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryGrantsResponse> grants_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryGrantsRequest> request) async {
    return grants(call, await request);
  }

  $async.Future<$0.QueryGrantsResponse> grants(
      $grpc.ServiceCall call, $0.QueryGrantsRequest request);
}
