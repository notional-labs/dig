///
//  Generated code. Do not modify.
//  source: cosmos/upgrade/v1beta1/upgrade.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const Plan$json = const {
  '1': 'Plan',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'time', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'time'},
    const {'1': 'height', '3': 3, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'info', '3': 4, '4': 1, '5': 9, '10': 'info'},
  ],
  '7': const {},
  '9': const [
    const {'1': 5, '2': 6},
  ],
  '10': const ['option'],
};

const SoftwareUpgradeProposal$json = const {
  '1': 'SoftwareUpgradeProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'plan', '3': 3, '4': 1, '5': 11, '6': '.cosmos.upgrade.v1beta1.Plan', '8': const {}, '10': 'plan'},
  ],
  '7': const {},
};

const CancelSoftwareUpgradeProposal$json = const {
  '1': 'CancelSoftwareUpgradeProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
  '7': const {},
};

