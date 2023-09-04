import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../ext/string_ext.dart';

class StorageUtil {
  final IStorage _storage;
  final String _language = "language";
  final String _currentSelectedMenuBottomNavigation =
      'currentSelectedMenuBottomNavigation';
  //
  final String _deviceId = "deviceId";

  StorageUtil(this._storage);

  Future<String?> getDeviceId() => _storage.read(key: _deviceId);

  setDeviceId(String deviceId) async =>
      await _storage.write(key: _deviceId, value: deviceId);

  Future<String?> getLanguage() => _storage.read(key: _language);

  setLanguage(String language) async =>
      await _storage.write(key: _language, value: language);

  Future<int?> currentSelectedMenuBottomNavigation() =>
      _storage.readInt(key: _currentSelectedMenuBottomNavigation);

  setCurrentSelectedMenuBottomNavigation(int value) => _storage.write(
      key: _currentSelectedMenuBottomNavigation, value: value.toString());

  Future<void> removeAll() => _storage.deleteAll();

  Future<void> logout() async {
    await removeAll();
  }
}

class SecureStorage implements IStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<bool> containKey({required String key}) {
    return _storage.containsKey(key: key);
  }

  @override
  Future<void> delete({required String key}) {
    return _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }

  @override
  Future<String?> read({required String key}) {
    return _storage.read(key: key);
  }

  @override
  Future<bool?> readBoolean({required String key}) {
    return _storage.read(key: key).then((value) => value?.parseBool());
  }

  @override
  Future<double?> readDouble({required String key}) {
    return _storage.read(key: key).then((value) => double.parse(value ?? ""));
  }

  @override
  Future<int?> readInt({required String key}) {
    return _storage.read(key: key).then((value) => int.tryParse(value ?? ""));
  }

  @override
  Future<void> write({required String key, required String? value}) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<bool> has(String key) async {
    return await _storage.read(key: key) != null;
  }
}

abstract class IStorage {
  Future<String?> read({required String key});
  Future<int?> readInt({required String key});
  Future<double?> readDouble({required String key});
  Future<bool?> readBoolean({required String key});

  Future<void> write({
    required String key,
    required String? value,
  });

  Future<bool> containKey({
    required String key,
  });

  Future<void> delete({
    required String key,
  });

  Future<void> deleteAll();

  Future<bool> has(String key);
}
