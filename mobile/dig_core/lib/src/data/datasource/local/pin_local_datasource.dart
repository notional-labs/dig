import 'package:dig_core/src/data/definition/definition.dart';
import 'package:dig_core/src/domain/util/util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class PinLocalDatasource {
  Future createPin(String pin);
  Future<bool> matchPin(String pin);
  Future<bool> checkHasPin();
  Future changePin(String pin);
  Future deletePin();
}

@Injectable(as: PinLocalDatasource)
class PinLocalDatasourceImplement implements PinLocalDatasource {
  final FlutterSecureStorage _storage;
  final CryptoUtils _cryptoUtils;
  PinLocalDatasourceImplement(this._storage, this._cryptoUtils);

  @override
  Future createPin(String pin) {
    final hash = _cryptoUtils.toSha256(pin).toString();
    return _storage.write(key: DigKey.pin, value: hash);
  }

  @override
  Future<bool> checkHasPin() async {
    final hashSaved = await _storage.read(key: DigKey.pin);
    return hashSaved != null;
  }

  @override
  Future<bool> matchPin(String pin) async {
    final hash = _cryptoUtils.toSha256(pin).toString();
    final hashSaved = await _storage.read(key: DigKey.pin);
    return hash == hashSaved;
  }

  @override
  Future changePin(String pin) async {
    await deletePin();
    return createPin(pin);
  }

  @override
  Future deletePin() => _storage.delete(key: DigKey.pin);
}
