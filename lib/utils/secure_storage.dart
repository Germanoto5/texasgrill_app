import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStorage {
  /// Methods

  Future<void> setString(String key, String? value) async {
    if (value == null) {
      await _storage?.delete(key: key);
    } else {
      await _storage?.write(key: key, value: value);
    }
  }

  Future<String?> getString(String key, {String? def}) async {
    final value = await _storage?.read(key: key);
    return value ?? def;
  }

  Future<void> setInt(String key, int value) async {
    await _storage?.write(key: key, value: value.toString());
  }

  Future<int?> getInt(String key, {int? def}) async {
    String? value = await _storage?.read(key: key);
    return int.tryParse(value ?? '') ?? def;
  }

  void setBool(String key, bool value) async {
    await _storage?.write(key: key, value: value.toString());
  }

  Future<bool> getBool(String key, bool def) async {
    final value = await _storage?.read(key: key);
    return value == null ? def : value == 'true';
  }

  Future<void> setDateTime(String key, DateTime? value) async {
    await _storage?.write(key: key, value: value?.toIso8601String());
  }

  Future<DateTime?> getDateTime(String key, {DateTime? def}) async {
    final value = await _storage?.read(key: key);
    return DateTime.tryParse(value ?? '') ?? def;
  }

  Future<bool> containKey(String? key) async {
    bool containsK = await _storage?.containsKey(key: key!) ?? false;
    return containsK;
  }
  Future<void> deleteKey(String? key) async {
    await _storage?.delete(key: key!);
  }

  Future<void> clear() async {
    await _storage?.deleteAll();
  }

  /// FlutterSecureStorage

  FlutterSecureStorage? _storage;

  /// Init

  Future<void> init() async {}

  /// Constructor

  static final SecureStorage _singleton = SecureStorage._internal();

  factory SecureStorage() {
    return _singleton;
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  SecureStorage._internal() {
    _storage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
    );
  }
}

SecureStorage secureStorage = SecureStorage();

