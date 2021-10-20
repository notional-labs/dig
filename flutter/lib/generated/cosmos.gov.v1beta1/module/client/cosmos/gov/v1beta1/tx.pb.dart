///
//  Generated code. Do not modify.
//  source: cosmos/gov/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/any.pb.dart' as $3;
import '../../base/v1beta1/coin.pb.dart' as $2;
import 'gov.pb.dart' as $6;

import 'gov.pbenum.dart' as $6;

class MsgSubmitProposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSubmitProposal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..aOM<$3.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: $3.Any.create)
    ..pc<$2.Coin>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initialDeposit', $pb.PbFieldType.PM, subBuilder: $2.Coin.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposer')
    ..hasRequiredFields = false
  ;

  MsgSubmitProposal._() : super();
  factory MsgSubmitProposal({
    $3.Any? content,
    $core.Iterable<$2.Coin>? initialDeposit,
    $core.String? proposer,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (initialDeposit != null) {
      _result.initialDeposit.addAll(initialDeposit);
    }
    if (proposer != null) {
      _result.proposer = proposer;
    }
    return _result;
  }
  factory MsgSubmitProposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSubmitProposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSubmitProposal clone() => MsgSubmitProposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSubmitProposal copyWith(void Function(MsgSubmitProposal) updates) => super.copyWith((message) => updates(message as MsgSubmitProposal)) as MsgSubmitProposal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSubmitProposal create() => MsgSubmitProposal._();
  MsgSubmitProposal createEmptyInstance() => create();
  static $pb.PbList<MsgSubmitProposal> createRepeated() => $pb.PbList<MsgSubmitProposal>();
  @$core.pragma('dart2js:noInline')
  static MsgSubmitProposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSubmitProposal>(create);
  static MsgSubmitProposal? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Any get content => $_getN(0);
  @$pb.TagNumber(1)
  set content($3.Any v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  $3.Any ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$2.Coin> get initialDeposit => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get proposer => $_getSZ(2);
  @$pb.TagNumber(3)
  set proposer($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProposer() => $_has(2);
  @$pb.TagNumber(3)
  void clearProposer() => clearField(3);
}

class MsgSubmitProposalResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSubmitProposalResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  MsgSubmitProposalResponse._() : super();
  factory MsgSubmitProposalResponse({
    $fixnum.Int64? proposalId,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    return _result;
  }
  factory MsgSubmitProposalResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSubmitProposalResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSubmitProposalResponse clone() => MsgSubmitProposalResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSubmitProposalResponse copyWith(void Function(MsgSubmitProposalResponse) updates) => super.copyWith((message) => updates(message as MsgSubmitProposalResponse)) as MsgSubmitProposalResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSubmitProposalResponse create() => MsgSubmitProposalResponse._();
  MsgSubmitProposalResponse createEmptyInstance() => create();
  static $pb.PbList<MsgSubmitProposalResponse> createRepeated() => $pb.PbList<MsgSubmitProposalResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgSubmitProposalResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSubmitProposalResponse>(create);
  static MsgSubmitProposalResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);
}

class MsgVote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgVote', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voter')
    ..e<$6.VoteOption>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'option', $pb.PbFieldType.OE, defaultOrMaker: $6.VoteOption.VOTE_OPTION_UNSPECIFIED, valueOf: $6.VoteOption.valueOf, enumValues: $6.VoteOption.values)
    ..hasRequiredFields = false
  ;

  MsgVote._() : super();
  factory MsgVote({
    $fixnum.Int64? proposalId,
    $core.String? voter,
    $6.VoteOption? option,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    if (voter != null) {
      _result.voter = voter;
    }
    if (option != null) {
      _result.option = option;
    }
    return _result;
  }
  factory MsgVote.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgVote.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgVote clone() => MsgVote()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgVote copyWith(void Function(MsgVote) updates) => super.copyWith((message) => updates(message as MsgVote)) as MsgVote; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgVote create() => MsgVote._();
  MsgVote createEmptyInstance() => create();
  static $pb.PbList<MsgVote> createRepeated() => $pb.PbList<MsgVote>();
  @$core.pragma('dart2js:noInline')
  static MsgVote getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgVote>(create);
  static MsgVote? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get voter => $_getSZ(1);
  @$pb.TagNumber(2)
  set voter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoter() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoter() => clearField(2);

  @$pb.TagNumber(3)
  $6.VoteOption get option => $_getN(2);
  @$pb.TagNumber(3)
  set option($6.VoteOption v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOption() => $_has(2);
  @$pb.TagNumber(3)
  void clearOption() => clearField(3);
}

class MsgVoteResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgVoteResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgVoteResponse._() : super();
  factory MsgVoteResponse() => create();
  factory MsgVoteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgVoteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgVoteResponse clone() => MsgVoteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgVoteResponse copyWith(void Function(MsgVoteResponse) updates) => super.copyWith((message) => updates(message as MsgVoteResponse)) as MsgVoteResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgVoteResponse create() => MsgVoteResponse._();
  MsgVoteResponse createEmptyInstance() => create();
  static $pb.PbList<MsgVoteResponse> createRepeated() => $pb.PbList<MsgVoteResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgVoteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgVoteResponse>(create);
  static MsgVoteResponse? _defaultInstance;
}

class MsgVoteWeighted extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgVoteWeighted', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voter')
    ..pc<$6.WeightedVoteOption>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'options', $pb.PbFieldType.PM, subBuilder: $6.WeightedVoteOption.create)
    ..hasRequiredFields = false
  ;

  MsgVoteWeighted._() : super();
  factory MsgVoteWeighted({
    $fixnum.Int64? proposalId,
    $core.String? voter,
    $core.Iterable<$6.WeightedVoteOption>? options,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    if (voter != null) {
      _result.voter = voter;
    }
    if (options != null) {
      _result.options.addAll(options);
    }
    return _result;
  }
  factory MsgVoteWeighted.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgVoteWeighted.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgVoteWeighted clone() => MsgVoteWeighted()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgVoteWeighted copyWith(void Function(MsgVoteWeighted) updates) => super.copyWith((message) => updates(message as MsgVoteWeighted)) as MsgVoteWeighted; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgVoteWeighted create() => MsgVoteWeighted._();
  MsgVoteWeighted createEmptyInstance() => create();
  static $pb.PbList<MsgVoteWeighted> createRepeated() => $pb.PbList<MsgVoteWeighted>();
  @$core.pragma('dart2js:noInline')
  static MsgVoteWeighted getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgVoteWeighted>(create);
  static MsgVoteWeighted? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get voter => $_getSZ(1);
  @$pb.TagNumber(2)
  set voter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoter() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoter() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$6.WeightedVoteOption> get options => $_getList(2);
}

class MsgVoteWeightedResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgVoteWeightedResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgVoteWeightedResponse._() : super();
  factory MsgVoteWeightedResponse() => create();
  factory MsgVoteWeightedResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgVoteWeightedResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgVoteWeightedResponse clone() => MsgVoteWeightedResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgVoteWeightedResponse copyWith(void Function(MsgVoteWeightedResponse) updates) => super.copyWith((message) => updates(message as MsgVoteWeightedResponse)) as MsgVoteWeightedResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgVoteWeightedResponse create() => MsgVoteWeightedResponse._();
  MsgVoteWeightedResponse createEmptyInstance() => create();
  static $pb.PbList<MsgVoteWeightedResponse> createRepeated() => $pb.PbList<MsgVoteWeightedResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgVoteWeightedResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgVoteWeightedResponse>(create);
  static MsgVoteWeightedResponse? _defaultInstance;
}

class MsgDeposit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgDeposit', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depositor')
    ..pc<$2.Coin>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.PM, subBuilder: $2.Coin.create)
    ..hasRequiredFields = false
  ;

  MsgDeposit._() : super();
  factory MsgDeposit({
    $fixnum.Int64? proposalId,
    $core.String? depositor,
    $core.Iterable<$2.Coin>? amount,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    if (depositor != null) {
      _result.depositor = depositor;
    }
    if (amount != null) {
      _result.amount.addAll(amount);
    }
    return _result;
  }
  factory MsgDeposit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgDeposit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgDeposit clone() => MsgDeposit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgDeposit copyWith(void Function(MsgDeposit) updates) => super.copyWith((message) => updates(message as MsgDeposit)) as MsgDeposit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgDeposit create() => MsgDeposit._();
  MsgDeposit createEmptyInstance() => create();
  static $pb.PbList<MsgDeposit> createRepeated() => $pb.PbList<MsgDeposit>();
  @$core.pragma('dart2js:noInline')
  static MsgDeposit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgDeposit>(create);
  static MsgDeposit? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get depositor => $_getSZ(1);
  @$pb.TagNumber(2)
  set depositor($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDepositor() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepositor() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$2.Coin> get amount => $_getList(2);
}

class MsgDepositResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgDepositResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgDepositResponse._() : super();
  factory MsgDepositResponse() => create();
  factory MsgDepositResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgDepositResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgDepositResponse clone() => MsgDepositResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgDepositResponse copyWith(void Function(MsgDepositResponse) updates) => super.copyWith((message) => updates(message as MsgDepositResponse)) as MsgDepositResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgDepositResponse create() => MsgDepositResponse._();
  MsgDepositResponse createEmptyInstance() => create();
  static $pb.PbList<MsgDepositResponse> createRepeated() => $pb.PbList<MsgDepositResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgDepositResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgDepositResponse>(create);
  static MsgDepositResponse? _defaultInstance;
}

