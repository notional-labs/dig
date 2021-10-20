///
//  Generated code. Do not modify.
//  source: ibc/core/client/v1/client.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../google/protobuf/any.pb.dart' as $6;
import '../../../../cosmos/upgrade/v1beta1/upgrade.pb.dart' as $7;

class IdentifiedClientState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IdentifiedClientState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.client.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientId')
    ..aOM<$6.Any>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientState', subBuilder: $6.Any.create)
    ..hasRequiredFields = false
  ;

  IdentifiedClientState._() : super();
  factory IdentifiedClientState({
    $core.String? clientId,
    $6.Any? clientState,
  }) {
    final _result = create();
    if (clientId != null) {
      _result.clientId = clientId;
    }
    if (clientState != null) {
      _result.clientState = clientState;
    }
    return _result;
  }
  factory IdentifiedClientState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdentifiedClientState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdentifiedClientState clone() => IdentifiedClientState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdentifiedClientState copyWith(void Function(IdentifiedClientState) updates) => super.copyWith((message) => updates(message as IdentifiedClientState)) as IdentifiedClientState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdentifiedClientState create() => IdentifiedClientState._();
  IdentifiedClientState createEmptyInstance() => create();
  static $pb.PbList<IdentifiedClientState> createRepeated() => $pb.PbList<IdentifiedClientState>();
  @$core.pragma('dart2js:noInline')
  static IdentifiedClientState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdentifiedClientState>(create);
  static IdentifiedClientState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);

  @$pb.TagNumber(2)
  $6.Any get clientState => $_getN(1);
  @$pb.TagNumber(2)
  set clientState($6.Any v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientState() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientState() => clearField(2);
  @$pb.TagNumber(2)
  $6.Any ensureClientState() => $_ensure(1);
}

class ConsensusStateWithHeight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConsensusStateWithHeight', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.client.v1'), createEmptyInstance: create)
    ..aOM<Height>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', subBuilder: Height.create)
    ..aOM<$6.Any>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consensusState', subBuilder: $6.Any.create)
    ..hasRequiredFields = false
  ;

  ConsensusStateWithHeight._() : super();
  factory ConsensusStateWithHeight({
    Height? height,
    $6.Any? consensusState,
  }) {
    final _result = create();
    if (height != null) {
      _result.height = height;
    }
    if (consensusState != null) {
      _result.consensusState = consensusState;
    }
    return _result;
  }
  factory ConsensusStateWithHeight.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConsensusStateWithHeight.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConsensusStateWithHeight clone() => ConsensusStateWithHeight()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConsensusStateWithHeight copyWith(void Function(ConsensusStateWithHeight) updates) => super.copyWith((message) => updates(message as ConsensusStateWithHeight)) as ConsensusStateWithHeight; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConsensusStateWithHeight create() => ConsensusStateWithHeight._();
  ConsensusStateWithHeight createEmptyInstance() => create();
  static $pb.PbList<ConsensusStateWithHeight> createRepeated() => $pb.PbList<ConsensusStateWithHeight>();
  @$core.pragma('dart2js:noInline')
  static ConsensusStateWithHeight getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConsensusStateWithHeight>(create);
  static ConsensusStateWithHeight? _defaultInstance;

  @$pb.TagNumber(1)
  Height get height => $_getN(0);
  @$pb.TagNumber(1)
  set height(Height v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
  @$pb.TagNumber(1)
  Height ensureHeight() => $_ensure(0);

  @$pb.TagNumber(2)
  $6.Any get consensusState => $_getN(1);
  @$pb.TagNumber(2)
  set consensusState($6.Any v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConsensusState() => $_has(1);
  @$pb.TagNumber(2)
  void clearConsensusState() => clearField(2);
  @$pb.TagNumber(2)
  $6.Any ensureConsensusState() => $_ensure(1);
}

class ClientConsensusStates extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientConsensusStates', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.client.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientId')
    ..pc<ConsensusStateWithHeight>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consensusStates', $pb.PbFieldType.PM, subBuilder: ConsensusStateWithHeight.create)
    ..hasRequiredFields = false
  ;

  ClientConsensusStates._() : super();
  factory ClientConsensusStates({
    $core.String? clientId,
    $core.Iterable<ConsensusStateWithHeight>? consensusStates,
  }) {
    final _result = create();
    if (clientId != null) {
      _result.clientId = clientId;
    }
    if (consensusStates != null) {
      _result.consensusStates.addAll(consensusStates);
    }
    return _result;
  }
  factory ClientConsensusStates.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientConsensusStates.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientConsensusStates clone() => ClientConsensusStates()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientConsensusStates copyWith(void Function(ClientConsensusStates) updates) => super.copyWith((message) => updates(message as ClientConsensusStates)) as ClientConsensusStates; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientConsensusStates create() => ClientConsensusStates._();
  ClientConsensusStates createEmptyInstance() => create();
  static $pb.PbList<ClientConsensusStates> createRepeated() => $pb.PbList<ClientConsensusStates>();
  @$core.pragma('dart2js:noInline')
  static ClientConsensusStates getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientConsensusStates>(create);
  static ClientConsensusStates? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ConsensusStateWithHeight> get consensusStates => $_getList(1);
}

class ClientUpdateProposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientUpdateProposal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.client.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subjectClientId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'substituteClientId')
    ..hasRequiredFields = false
  ;

  ClientUpdateProposal._() : super();
  factory ClientUpdateProposal({
    $core.String? title,
    $core.String? description,
    $core.String? subjectClientId,
    $core.String? substituteClientId,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (subjectClientId != null) {
      _result.subjectClientId = subjectClientId;
    }
    if (substituteClientId != null) {
      _result.substituteClientId = substituteClientId;
    }
    return _result;
  }
  factory ClientUpdateProposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientUpdateProposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientUpdateProposal clone() => ClientUpdateProposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientUpdateProposal copyWith(void Function(ClientUpdateProposal) updates) => super.copyWith((message) => updates(message as ClientUpdateProposal)) as ClientUpdateProposal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientUpdateProposal create() => ClientUpdateProposal._();
  ClientUpdateProposal createEmptyInstance() => create();
  static $pb.PbList<ClientUpdateProposal> createRepeated() => $pb.PbList<ClientUpdateProposal>();
  @$core.pragma('dart2js:noInline')
  static ClientUpdateProposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientUpdateProposal>(create);
  static ClientUpdateProposal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get subjectClientId => $_getSZ(2);
  @$pb.TagNumber(3)
  set subjectClientId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubjectClientId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubjectClientId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get substituteClientId => $_getSZ(3);
  @$pb.TagNumber(4)
  set substituteClientId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSubstituteClientId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubstituteClientId() => clearField(4);
}

class UpgradeProposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpgradeProposal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.client.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$7.Plan>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'plan', subBuilder: $7.Plan.create)
    ..aOM<$6.Any>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'upgradedClientState', subBuilder: $6.Any.create)
    ..hasRequiredFields = false
  ;

  UpgradeProposal._() : super();
  factory UpgradeProposal({
    $core.String? title,
    $core.String? description,
    $7.Plan? plan,
    $6.Any? upgradedClientState,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (plan != null) {
      _result.plan = plan;
    }
    if (upgradedClientState != null) {
      _result.upgradedClientState = upgradedClientState;
    }
    return _result;
  }
  factory UpgradeProposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpgradeProposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpgradeProposal clone() => UpgradeProposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpgradeProposal copyWith(void Function(UpgradeProposal) updates) => super.copyWith((message) => updates(message as UpgradeProposal)) as UpgradeProposal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpgradeProposal create() => UpgradeProposal._();
  UpgradeProposal createEmptyInstance() => create();
  static $pb.PbList<UpgradeProposal> createRepeated() => $pb.PbList<UpgradeProposal>();
  @$core.pragma('dart2js:noInline')
  static UpgradeProposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpgradeProposal>(create);
  static UpgradeProposal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $7.Plan get plan => $_getN(2);
  @$pb.TagNumber(3)
  set plan($7.Plan v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlan() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlan() => clearField(3);
  @$pb.TagNumber(3)
  $7.Plan ensurePlan() => $_ensure(2);

  @$pb.TagNumber(4)
  $6.Any get upgradedClientState => $_getN(3);
  @$pb.TagNumber(4)
  set upgradedClientState($6.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpgradedClientState() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpgradedClientState() => clearField(4);
  @$pb.TagNumber(4)
  $6.Any ensureUpgradedClientState() => $_ensure(3);
}

class Height extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Height', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.client.v1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'revisionNumber', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'revisionHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Height._() : super();
  factory Height({
    $fixnum.Int64? revisionNumber,
    $fixnum.Int64? revisionHeight,
  }) {
    final _result = create();
    if (revisionNumber != null) {
      _result.revisionNumber = revisionNumber;
    }
    if (revisionHeight != null) {
      _result.revisionHeight = revisionHeight;
    }
    return _result;
  }
  factory Height.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Height.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Height clone() => Height()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Height copyWith(void Function(Height) updates) => super.copyWith((message) => updates(message as Height)) as Height; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Height create() => Height._();
  Height createEmptyInstance() => create();
  static $pb.PbList<Height> createRepeated() => $pb.PbList<Height>();
  @$core.pragma('dart2js:noInline')
  static Height getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Height>(create);
  static Height? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get revisionNumber => $_getI64(0);
  @$pb.TagNumber(1)
  set revisionNumber($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRevisionNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearRevisionNumber() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get revisionHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set revisionHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRevisionHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRevisionHeight() => clearField(2);
}

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Params', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.client.v1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowedClients')
    ..hasRequiredFields = false
  ;

  Params._() : super();
  factory Params({
    $core.Iterable<$core.String>? allowedClients,
  }) {
    final _result = create();
    if (allowedClients != null) {
      _result.allowedClients.addAll(allowedClients);
    }
    return _result;
  }
  factory Params.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Params.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Params clone() => Params()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Params copyWith(void Function(Params) updates) => super.copyWith((message) => updates(message as Params)) as Params; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Params create() => Params._();
  Params createEmptyInstance() => create();
  static $pb.PbList<Params> createRepeated() => $pb.PbList<Params>();
  @$core.pragma('dart2js:noInline')
  static Params getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Params>(create);
  static Params? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get allowedClients => $_getList(0);
}

