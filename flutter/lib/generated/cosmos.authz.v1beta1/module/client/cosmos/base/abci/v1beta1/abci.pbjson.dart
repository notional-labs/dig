///
//  Generated code. Do not modify.
//  source: cosmos/base/abci/v1beta1/abci.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use txResponseDescriptor instead')
const TxResponse$json = const {
  '1': 'TxResponse',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'txhash', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'txhash'},
    const {'1': 'codespace', '3': 3, '4': 1, '5': 9, '10': 'codespace'},
    const {'1': 'code', '3': 4, '4': 1, '5': 13, '10': 'code'},
    const {'1': 'data', '3': 5, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'raw_log', '3': 6, '4': 1, '5': 9, '10': 'rawLog'},
    const {'1': 'logs', '3': 7, '4': 3, '5': 11, '6': '.cosmos.base.abci.v1beta1.ABCIMessageLog', '8': const {}, '10': 'logs'},
    const {'1': 'info', '3': 8, '4': 1, '5': 9, '10': 'info'},
    const {'1': 'gas_wanted', '3': 9, '4': 1, '5': 3, '10': 'gasWanted'},
    const {'1': 'gas_used', '3': 10, '4': 1, '5': 3, '10': 'gasUsed'},
    const {'1': 'tx', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'tx'},
    const {'1': 'timestamp', '3': 12, '4': 1, '5': 9, '10': 'timestamp'},
  ],
  '7': const {},
};

/// Descriptor for `TxResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txResponseDescriptor = $convert.base64Decode('CgpUeFJlc3BvbnNlEhYKBmhlaWdodBgBIAEoA1IGaGVpZ2h0EiIKBnR4aGFzaBgCIAEoCUIK4t4fBlR4SGFzaFIGdHhoYXNoEhwKCWNvZGVzcGFjZRgDIAEoCVIJY29kZXNwYWNlEhIKBGNvZGUYBCABKA1SBGNvZGUSEgoEZGF0YRgFIAEoCVIEZGF0YRIXCgdyYXdfbG9nGAYgASgJUgZyYXdMb2cSVQoEbG9ncxgHIAMoCzIoLmNvc21vcy5iYXNlLmFiY2kudjFiZXRhMS5BQkNJTWVzc2FnZUxvZ0IXqt8fD0FCQ0lNZXNzYWdlTG9nc8jeHwBSBGxvZ3MSEgoEaW5mbxgIIAEoCVIEaW5mbxIdCgpnYXNfd2FudGVkGAkgASgDUglnYXNXYW50ZWQSGQoIZ2FzX3VzZWQYCiABKANSB2dhc1VzZWQSJAoCdHgYCyABKAsyFC5nb29nbGUucHJvdG9idWYuQW55UgJ0eBIcCgl0aW1lc3RhbXAYDCABKAlSCXRpbWVzdGFtcDoEiKAfAA==');
@$core.Deprecated('Use aBCIMessageLogDescriptor instead')
const ABCIMessageLog$json = const {
  '1': 'ABCIMessageLog',
  '2': const [
    const {'1': 'msg_index', '3': 1, '4': 1, '5': 13, '10': 'msgIndex'},
    const {'1': 'log', '3': 2, '4': 1, '5': 9, '10': 'log'},
    const {'1': 'events', '3': 3, '4': 3, '5': 11, '6': '.cosmos.base.abci.v1beta1.StringEvent', '8': const {}, '10': 'events'},
  ],
  '7': const {},
};

/// Descriptor for `ABCIMessageLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aBCIMessageLogDescriptor = $convert.base64Decode('Cg5BQkNJTWVzc2FnZUxvZxIbCgltc2dfaW5kZXgYASABKA1SCG1zZ0luZGV4EhAKA2xvZxgCIAEoCVIDbG9nElMKBmV2ZW50cxgDIAMoCzIlLmNvc21vcy5iYXNlLmFiY2kudjFiZXRhMS5TdHJpbmdFdmVudEIUqt8fDFN0cmluZ0V2ZW50c8jeHwBSBmV2ZW50czoEgNwgAQ==');
@$core.Deprecated('Use stringEventDescriptor instead')
const StringEvent$json = const {
  '1': 'StringEvent',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'attributes', '3': 2, '4': 3, '5': 11, '6': '.cosmos.base.abci.v1beta1.Attribute', '8': const {}, '10': 'attributes'},
  ],
  '7': const {},
};

/// Descriptor for `StringEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stringEventDescriptor = $convert.base64Decode('CgtTdHJpbmdFdmVudBISCgR0eXBlGAEgASgJUgR0eXBlEkkKCmF0dHJpYnV0ZXMYAiADKAsyIy5jb3Ntb3MuYmFzZS5hYmNpLnYxYmV0YTEuQXR0cmlidXRlQgTI3h8AUgphdHRyaWJ1dGVzOgSA3CAB');
@$core.Deprecated('Use attributeDescriptor instead')
const Attribute$json = const {
  '1': 'Attribute',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Attribute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attributeDescriptor = $convert.base64Decode('CglBdHRyaWJ1dGUSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVl');
@$core.Deprecated('Use gasInfoDescriptor instead')
const GasInfo$json = const {
  '1': 'GasInfo',
  '2': const [
    const {'1': 'gas_wanted', '3': 1, '4': 1, '5': 4, '8': const {}, '10': 'gasWanted'},
    const {'1': 'gas_used', '3': 2, '4': 1, '5': 4, '8': const {}, '10': 'gasUsed'},
  ],
};

/// Descriptor for `GasInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gasInfoDescriptor = $convert.base64Decode('CgdHYXNJbmZvEjQKCmdhc193YW50ZWQYASABKARCFfLeHxF5YW1sOiJnYXNfd2FudGVkIlIJZ2FzV2FudGVkEi4KCGdhc191c2VkGAIgASgEQhPy3h8PeWFtbDoiZ2FzX3VzZWQiUgdnYXNVc2Vk');
@$core.Deprecated('Use resultDescriptor instead')
const Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'log', '3': 2, '4': 1, '5': 9, '10': 'log'},
    const {'1': 'events', '3': 3, '4': 3, '5': 11, '6': '.tendermint.abci.Event', '8': const {}, '10': 'events'},
  ],
  '7': const {},
};

/// Descriptor for `Result`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultDescriptor = $convert.base64Decode('CgZSZXN1bHQSEgoEZGF0YRgBIAEoDFIEZGF0YRIQCgNsb2cYAiABKAlSA2xvZxI0CgZldmVudHMYAyADKAsyFi50ZW5kZXJtaW50LmFiY2kuRXZlbnRCBMjeHwBSBmV2ZW50czoEiKAfAA==');
@$core.Deprecated('Use simulationResponseDescriptor instead')
const SimulationResponse$json = const {
  '1': 'SimulationResponse',
  '2': const [
    const {'1': 'gas_info', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.abci.v1beta1.GasInfo', '8': const {}, '10': 'gasInfo'},
    const {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.abci.v1beta1.Result', '10': 'result'},
  ],
};

/// Descriptor for `SimulationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List simulationResponseDescriptor = $convert.base64Decode('ChJTaW11bGF0aW9uUmVzcG9uc2USRgoIZ2FzX2luZm8YASABKAsyIS5jb3Ntb3MuYmFzZS5hYmNpLnYxYmV0YTEuR2FzSW5mb0II0N4fAcjeHwBSB2dhc0luZm8SOAoGcmVzdWx0GAIgASgLMiAuY29zbW9zLmJhc2UuYWJjaS52MWJldGExLlJlc3VsdFIGcmVzdWx0');
@$core.Deprecated('Use msgDataDescriptor instead')
const MsgData$json = const {
  '1': 'MsgData',
  '2': const [
    const {'1': 'msg_type', '3': 1, '4': 1, '5': 9, '10': 'msgType'},
    const {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
  '7': const {},
};

/// Descriptor for `MsgData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgDataDescriptor = $convert.base64Decode('CgdNc2dEYXRhEhkKCG1zZ190eXBlGAEgASgJUgdtc2dUeXBlEhIKBGRhdGEYAiABKAxSBGRhdGE6BIDcIAE=');
@$core.Deprecated('Use txMsgDataDescriptor instead')
const TxMsgData$json = const {
  '1': 'TxMsgData',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.cosmos.base.abci.v1beta1.MsgData', '10': 'data'},
  ],
  '7': const {},
};

/// Descriptor for `TxMsgData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txMsgDataDescriptor = $convert.base64Decode('CglUeE1zZ0RhdGESNQoEZGF0YRgBIAMoCzIhLmNvc21vcy5iYXNlLmFiY2kudjFiZXRhMS5Nc2dEYXRhUgRkYXRhOgSA3CAB');
@$core.Deprecated('Use searchTxsResultDescriptor instead')
const SearchTxsResult$json = const {
  '1': 'SearchTxsResult',
  '2': const [
    const {'1': 'total_count', '3': 1, '4': 1, '5': 4, '8': const {}, '10': 'totalCount'},
    const {'1': 'count', '3': 2, '4': 1, '5': 4, '10': 'count'},
    const {'1': 'page_number', '3': 3, '4': 1, '5': 4, '8': const {}, '10': 'pageNumber'},
    const {'1': 'page_total', '3': 4, '4': 1, '5': 4, '8': const {}, '10': 'pageTotal'},
    const {'1': 'limit', '3': 5, '4': 1, '5': 4, '10': 'limit'},
    const {'1': 'txs', '3': 6, '4': 3, '5': 11, '6': '.cosmos.base.abci.v1beta1.TxResponse', '10': 'txs'},
  ],
  '7': const {},
};

/// Descriptor for `SearchTxsResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchTxsResultDescriptor = $convert.base64Decode('Cg9TZWFyY2hUeHNSZXN1bHQSRgoLdG90YWxfY291bnQYASABKARCJfLeHxJ5YW1sOiJ0b3RhbF9jb3VudCLq3h8LdG90YWxfY291bnRSCnRvdGFsQ291bnQSFAoFY291bnQYAiABKARSBWNvdW50EkYKC3BhZ2VfbnVtYmVyGAMgASgEQiXy3h8SeWFtbDoicGFnZV9udW1iZXIi6t4fC3BhZ2VfbnVtYmVyUgpwYWdlTnVtYmVyEkIKCnBhZ2VfdG90YWwYBCABKARCI/LeHxF5YW1sOiJwYWdlX3RvdGFsIureHwpwYWdlX3RvdGFsUglwYWdlVG90YWwSFAoFbGltaXQYBSABKARSBWxpbWl0EjYKA3R4cxgGIAMoCzIkLmNvc21vcy5iYXNlLmFiY2kudjFiZXRhMS5UeFJlc3BvbnNlUgN0eHM6BIDcIAE=');
