///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/tx.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const MsgGrant$json = const {
  '1': 'MsgGrant',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'grant', '3': 3, '4': 1, '5': 11, '6': '.cosmos.authz.v1beta1.Grant', '8': const {}, '10': 'grant'},
  ],
};

const MsgExecResponse$json = const {
  '1': 'MsgExecResponse',
  '2': const [
    const {'1': 'results', '3': 1, '4': 3, '5': 12, '10': 'results'},
  ],
};

const MsgExec$json = const {
  '1': 'MsgExec',
  '2': const [
    const {'1': 'grantee', '3': 1, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'msgs', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'msgs'},
  ],
};

const MsgGrantResponse$json = const {
  '1': 'MsgGrantResponse',
};

const MsgRevoke$json = const {
  '1': 'MsgRevoke',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'msg_type_url', '3': 3, '4': 1, '5': 9, '10': 'msgTypeUrl'},
  ],
};

const MsgRevokeResponse$json = const {
  '1': 'MsgRevokeResponse',
};

