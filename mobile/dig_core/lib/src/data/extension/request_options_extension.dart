import 'dart:convert';
import 'package:dio/dio.dart';

extension RequestOptionsExts on RequestOptions {
  String toCURL() {
    var curl = '';
    // Add PATH + REQUEST_METHOD
    curl +=
        // ignore: lines_longer_than_80_chars
        'curl --request $method \'$uri\'';

    // Include headers
    for (final key in headers.keys) {
      curl += ' -H \'$key: ${headers[key]}\'';
    }
    // Include data if there is data
    if (data != null && data is! FormData) {
      if (data is Map && (data as Map).isEmpty) {
      } else {
        curl += ' --data-binary \'${json.encode(data)}\'';
      }
    }
    curl += ' --insecure'; //bypass https verification
    return curl;
  }
}
