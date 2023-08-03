import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StoreKey {
  theme("theme"),
  accessToken("access_token"),
  refreshToken("refresh_token");

  final String value;

  const StoreKey(this.value);
}

abstract class IStorageManager {
  Future<T> save<T>(
    StoreKey key,
    T value, {
    required bool securely,
  }) {
    throw "Unimplemented";
  }

  Future<T?> read<T>(StoreKey key) async {
    throw "Unimplemented";
  }

  Future<void> remove(StoreKey key) async {
    throw "Unimplemented";
  }
}

class StorageManager extends IStorageManager {
  SharedPreferences? _preferences;
  final _secureStorage = const FlutterSecureStorage();

  Future<SharedPreferences> initialize() => SharedPreferences.getInstance();

  @override
  Future<T> save<T>(
    StoreKey key,
    T value, {
    required bool securely,
  }) async {
    if (!securely) {
      return saveToSharedPreferences(
        key,
        value,
      );
    }
    await _secureStorage.write(
      key: key.value,
      value: value.toString(),
    );
    return value;
  }

  @override
  Future<T?> read<T>(StoreKey key) async {
    _preferences ??= await initialize();
    final value = _preferences!.get(key.value);
    if (value != null) {
      return value as T;
    }

    final result = await _secureStorage.read(
      key: key.value,
    );
    if (result == null) {
      return null;
    }
    if (T == bool) {
      return _stringToBool(result) as T;
    } else if (T == int) {
      return int.parse(result) as T;
    } else if (T == double) {
      return double.parse(result) as T;
    } else if (T == String) {
      return result as T;
    } else {
      throw Exception('Unsupported type: ${T.toString()}');
    }
  }

  @override
  Future<void> remove(StoreKey key) async {
    _preferences ??= await initialize();
    _preferences!.remove(key.value);
    _secureStorage.delete(key: key.value);
  }
}

extension _Helpers on StorageManager {
  Future<T> saveToSharedPreferences<T>(StoreKey key, T value) async {
    _preferences ??= await initialize();

    if (T == bool) {
      await _preferences!.setBool(key.value, value as bool);
    } else if (T == int) {
      await _preferences!.setInt(key.value, value as int);
    } else if (T == double) {
      await _preferences!.setDouble(key.value, value as double);
    } else if (T == String) {
      await _preferences!.setString(key.value, value as String);
    } else if (T == List<String>) {
      await _preferences!.setStringList(key.value, value as List<String>);
    } else {
      throw Exception('Unsupported type: ${T.toString()}');
    }

    return value;
  }
}

bool _stringToBool(String value) {
  // Convert the string to lowercase for case-insensitive comparison
  final lowercaseValue = value.toLowerCase();

  if (lowercaseValue == 'true' ||
      lowercaseValue == 'yes' ||
      lowercaseValue == '1') {
    return true;
  } else if (lowercaseValue == 'false' ||
      lowercaseValue == 'no' ||
      lowercaseValue == '0') {
    return false;
  } else {
    throw FormatException('Invalid boolean representation: $value');
  }
}
