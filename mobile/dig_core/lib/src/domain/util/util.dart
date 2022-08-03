import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';

@injectable
class CryptoUtils {
  Digest toSha256(String value) {
    final bytes = utf8.encode(value);
    return sha256.convert(bytes);
  }
}
