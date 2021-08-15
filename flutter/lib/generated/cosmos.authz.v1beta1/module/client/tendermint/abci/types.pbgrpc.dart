///
//  Generated code. Do not modify.
//  source: tendermint/abci/types.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'types.pb.dart' as $1;
export 'types.pb.dart';

class ABCIApplicationClient extends $grpc.Client {
  static final _$echo = $grpc.ClientMethod<$1.RequestEcho, $1.ResponseEcho>(
      '/tendermint.abci.ABCIApplication/Echo',
      ($1.RequestEcho value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ResponseEcho.fromBuffer(value));
  static final _$flush = $grpc.ClientMethod<$1.RequestFlush, $1.ResponseFlush>(
      '/tendermint.abci.ABCIApplication/Flush',
      ($1.RequestFlush value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ResponseFlush.fromBuffer(value));
  static final _$info = $grpc.ClientMethod<$1.RequestInfo, $1.ResponseInfo>(
      '/tendermint.abci.ABCIApplication/Info',
      ($1.RequestInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ResponseInfo.fromBuffer(value));
  static final _$setOption =
      $grpc.ClientMethod<$1.RequestSetOption, $1.ResponseSetOption>(
          '/tendermint.abci.ABCIApplication/SetOption',
          ($1.RequestSetOption value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseSetOption.fromBuffer(value));
  static final _$deliverTx =
      $grpc.ClientMethod<$1.RequestDeliverTx, $1.ResponseDeliverTx>(
          '/tendermint.abci.ABCIApplication/DeliverTx',
          ($1.RequestDeliverTx value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseDeliverTx.fromBuffer(value));
  static final _$checkTx =
      $grpc.ClientMethod<$1.RequestCheckTx, $1.ResponseCheckTx>(
          '/tendermint.abci.ABCIApplication/CheckTx',
          ($1.RequestCheckTx value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseCheckTx.fromBuffer(value));
  static final _$query = $grpc.ClientMethod<$1.RequestQuery, $1.ResponseQuery>(
      '/tendermint.abci.ABCIApplication/Query',
      ($1.RequestQuery value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ResponseQuery.fromBuffer(value));
  static final _$commit =
      $grpc.ClientMethod<$1.RequestCommit, $1.ResponseCommit>(
          '/tendermint.abci.ABCIApplication/Commit',
          ($1.RequestCommit value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.ResponseCommit.fromBuffer(value));
  static final _$initChain =
      $grpc.ClientMethod<$1.RequestInitChain, $1.ResponseInitChain>(
          '/tendermint.abci.ABCIApplication/InitChain',
          ($1.RequestInitChain value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseInitChain.fromBuffer(value));
  static final _$beginBlock =
      $grpc.ClientMethod<$1.RequestBeginBlock, $1.ResponseBeginBlock>(
          '/tendermint.abci.ABCIApplication/BeginBlock',
          ($1.RequestBeginBlock value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseBeginBlock.fromBuffer(value));
  static final _$endBlock =
      $grpc.ClientMethod<$1.RequestEndBlock, $1.ResponseEndBlock>(
          '/tendermint.abci.ABCIApplication/EndBlock',
          ($1.RequestEndBlock value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseEndBlock.fromBuffer(value));
  static final _$listSnapshots =
      $grpc.ClientMethod<$1.RequestListSnapshots, $1.ResponseListSnapshots>(
          '/tendermint.abci.ABCIApplication/ListSnapshots',
          ($1.RequestListSnapshots value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseListSnapshots.fromBuffer(value));
  static final _$offerSnapshot =
      $grpc.ClientMethod<$1.RequestOfferSnapshot, $1.ResponseOfferSnapshot>(
          '/tendermint.abci.ABCIApplication/OfferSnapshot',
          ($1.RequestOfferSnapshot value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ResponseOfferSnapshot.fromBuffer(value));
  static final _$loadSnapshotChunk = $grpc.ClientMethod<
          $1.RequestLoadSnapshotChunk, $1.ResponseLoadSnapshotChunk>(
      '/tendermint.abci.ABCIApplication/LoadSnapshotChunk',
      ($1.RequestLoadSnapshotChunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.ResponseLoadSnapshotChunk.fromBuffer(value));
  static final _$applySnapshotChunk = $grpc.ClientMethod<
          $1.RequestApplySnapshotChunk, $1.ResponseApplySnapshotChunk>(
      '/tendermint.abci.ABCIApplication/ApplySnapshotChunk',
      ($1.RequestApplySnapshotChunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.ResponseApplySnapshotChunk.fromBuffer(value));

  ABCIApplicationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ResponseEcho> echo($1.RequestEcho request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$echo, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseFlush> flush($1.RequestFlush request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$flush, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseInfo> info($1.RequestInfo request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$info, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseSetOption> setOption(
      $1.RequestSetOption request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$setOption, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseDeliverTx> deliverTx(
      $1.RequestDeliverTx request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deliverTx, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseCheckTx> checkTx($1.RequestCheckTx request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$checkTx, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseQuery> query($1.RequestQuery request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$query, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseCommit> commit($1.RequestCommit request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$commit, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseInitChain> initChain(
      $1.RequestInitChain request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$initChain, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseBeginBlock> beginBlock(
      $1.RequestBeginBlock request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$beginBlock, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseEndBlock> endBlock($1.RequestEndBlock request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$endBlock, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseListSnapshots> listSnapshots(
      $1.RequestListSnapshots request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$listSnapshots, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseOfferSnapshot> offerSnapshot(
      $1.RequestOfferSnapshot request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$offerSnapshot, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseLoadSnapshotChunk> loadSnapshotChunk(
      $1.RequestLoadSnapshotChunk request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$loadSnapshotChunk, request, options: options);
  }

  $grpc.ResponseFuture<$1.ResponseApplySnapshotChunk> applySnapshotChunk(
      $1.RequestApplySnapshotChunk request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$applySnapshotChunk, request, options: options);
  }
}

abstract class ABCIApplicationServiceBase extends $grpc.Service {
  $core.String get $name => 'tendermint.abci.ABCIApplication';

  ABCIApplicationServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.RequestEcho, $1.ResponseEcho>(
        'Echo',
        echo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestEcho.fromBuffer(value),
        ($1.ResponseEcho value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestFlush, $1.ResponseFlush>(
        'Flush',
        flush_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestFlush.fromBuffer(value),
        ($1.ResponseFlush value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestInfo, $1.ResponseInfo>(
        'Info',
        info_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestInfo.fromBuffer(value),
        ($1.ResponseInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestSetOption, $1.ResponseSetOption>(
        'SetOption',
        setOption_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestSetOption.fromBuffer(value),
        ($1.ResponseSetOption value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestDeliverTx, $1.ResponseDeliverTx>(
        'DeliverTx',
        deliverTx_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestDeliverTx.fromBuffer(value),
        ($1.ResponseDeliverTx value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestCheckTx, $1.ResponseCheckTx>(
        'CheckTx',
        checkTx_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestCheckTx.fromBuffer(value),
        ($1.ResponseCheckTx value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestQuery, $1.ResponseQuery>(
        'Query',
        query_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestQuery.fromBuffer(value),
        ($1.ResponseQuery value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestCommit, $1.ResponseCommit>(
        'Commit',
        commit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestCommit.fromBuffer(value),
        ($1.ResponseCommit value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestInitChain, $1.ResponseInitChain>(
        'InitChain',
        initChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestInitChain.fromBuffer(value),
        ($1.ResponseInitChain value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestBeginBlock, $1.ResponseBeginBlock>(
        'BeginBlock',
        beginBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestBeginBlock.fromBuffer(value),
        ($1.ResponseBeginBlock value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestEndBlock, $1.ResponseEndBlock>(
        'EndBlock',
        endBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestEndBlock.fromBuffer(value),
        ($1.ResponseEndBlock value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.RequestListSnapshots, $1.ResponseListSnapshots>(
            'ListSnapshots',
            listSnapshots_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.RequestListSnapshots.fromBuffer(value),
            ($1.ResponseListSnapshots value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.RequestOfferSnapshot, $1.ResponseOfferSnapshot>(
            'OfferSnapshot',
            offerSnapshot_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.RequestOfferSnapshot.fromBuffer(value),
            ($1.ResponseOfferSnapshot value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestLoadSnapshotChunk,
            $1.ResponseLoadSnapshotChunk>(
        'LoadSnapshotChunk',
        loadSnapshotChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.RequestLoadSnapshotChunk.fromBuffer(value),
        ($1.ResponseLoadSnapshotChunk value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestApplySnapshotChunk,
            $1.ResponseApplySnapshotChunk>(
        'ApplySnapshotChunk',
        applySnapshotChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.RequestApplySnapshotChunk.fromBuffer(value),
        ($1.ResponseApplySnapshotChunk value) => value.writeToBuffer()));
  }

  $async.Future<$1.ResponseEcho> echo_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RequestEcho> request) async {
    return echo(call, await request);
  }

  $async.Future<$1.ResponseFlush> flush_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RequestFlush> request) async {
    return flush(call, await request);
  }

  $async.Future<$1.ResponseInfo> info_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RequestInfo> request) async {
    return info(call, await request);
  }

  $async.Future<$1.ResponseSetOption> setOption_Pre($grpc.ServiceCall call,
      $async.Future<$1.RequestSetOption> request) async {
    return setOption(call, await request);
  }

  $async.Future<$1.ResponseDeliverTx> deliverTx_Pre($grpc.ServiceCall call,
      $async.Future<$1.RequestDeliverTx> request) async {
    return deliverTx(call, await request);
  }

  $async.Future<$1.ResponseCheckTx> checkTx_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RequestCheckTx> request) async {
    return checkTx(call, await request);
  }

  $async.Future<$1.ResponseQuery> query_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RequestQuery> request) async {
    return query(call, await request);
  }

  $async.Future<$1.ResponseCommit> commit_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RequestCommit> request) async {
    return commit(call, await request);
  }

  $async.Future<$1.ResponseInitChain> initChain_Pre($grpc.ServiceCall call,
      $async.Future<$1.RequestInitChain> request) async {
    return initChain(call, await request);
  }

  $async.Future<$1.ResponseBeginBlock> beginBlock_Pre($grpc.ServiceCall call,
      $async.Future<$1.RequestBeginBlock> request) async {
    return beginBlock(call, await request);
  }

  $async.Future<$1.ResponseEndBlock> endBlock_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RequestEndBlock> request) async {
    return endBlock(call, await request);
  }

  $async.Future<$1.ResponseListSnapshots> listSnapshots_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RequestListSnapshots> request) async {
    return listSnapshots(call, await request);
  }

  $async.Future<$1.ResponseOfferSnapshot> offerSnapshot_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RequestOfferSnapshot> request) async {
    return offerSnapshot(call, await request);
  }

  $async.Future<$1.ResponseLoadSnapshotChunk> loadSnapshotChunk_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RequestLoadSnapshotChunk> request) async {
    return loadSnapshotChunk(call, await request);
  }

  $async.Future<$1.ResponseApplySnapshotChunk> applySnapshotChunk_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RequestApplySnapshotChunk> request) async {
    return applySnapshotChunk(call, await request);
  }

  $async.Future<$1.ResponseEcho> echo(
      $grpc.ServiceCall call, $1.RequestEcho request);
  $async.Future<$1.ResponseFlush> flush(
      $grpc.ServiceCall call, $1.RequestFlush request);
  $async.Future<$1.ResponseInfo> info(
      $grpc.ServiceCall call, $1.RequestInfo request);
  $async.Future<$1.ResponseSetOption> setOption(
      $grpc.ServiceCall call, $1.RequestSetOption request);
  $async.Future<$1.ResponseDeliverTx> deliverTx(
      $grpc.ServiceCall call, $1.RequestDeliverTx request);
  $async.Future<$1.ResponseCheckTx> checkTx(
      $grpc.ServiceCall call, $1.RequestCheckTx request);
  $async.Future<$1.ResponseQuery> query(
      $grpc.ServiceCall call, $1.RequestQuery request);
  $async.Future<$1.ResponseCommit> commit(
      $grpc.ServiceCall call, $1.RequestCommit request);
  $async.Future<$1.ResponseInitChain> initChain(
      $grpc.ServiceCall call, $1.RequestInitChain request);
  $async.Future<$1.ResponseBeginBlock> beginBlock(
      $grpc.ServiceCall call, $1.RequestBeginBlock request);
  $async.Future<$1.ResponseEndBlock> endBlock(
      $grpc.ServiceCall call, $1.RequestEndBlock request);
  $async.Future<$1.ResponseListSnapshots> listSnapshots(
      $grpc.ServiceCall call, $1.RequestListSnapshots request);
  $async.Future<$1.ResponseOfferSnapshot> offerSnapshot(
      $grpc.ServiceCall call, $1.RequestOfferSnapshot request);
  $async.Future<$1.ResponseLoadSnapshotChunk> loadSnapshotChunk(
      $grpc.ServiceCall call, $1.RequestLoadSnapshotChunk request);
  $async.Future<$1.ResponseApplySnapshotChunk> applySnapshotChunk(
      $grpc.ServiceCall call, $1.RequestApplySnapshotChunk request);
}
