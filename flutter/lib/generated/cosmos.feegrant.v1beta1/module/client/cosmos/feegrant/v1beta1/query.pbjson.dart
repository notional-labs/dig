///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/query.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const QueryAllowanceRequest$json = const {
  '1': 'QueryAllowanceRequest',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
  ],
};

const QueryAllowanceResponse$json = const {
  '1': 'QueryAllowanceResponse',
  '2': const [
    const {'1': 'allowance', '3': 1, '4': 1, '5': 11, '6': '.cosmos.feegrant.v1beta1.Grant', '10': 'allowance'},
  ],
};

const QueryAllowancesRequest$json = const {
  '1': 'QueryAllowancesRequest',
  '2': const [
    const {'1': 'grantee', '3': 1, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

const QueryAllowancesResponse$json = const {
  '1': 'QueryAllowancesResponse',
  '2': const [
    const {'1': 'allowances', '3': 1, '4': 3, '5': 11, '6': '.cosmos.feegrant.v1beta1.Grant', '10': 'allowances'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

