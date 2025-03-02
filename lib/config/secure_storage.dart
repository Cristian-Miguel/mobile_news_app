import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static String get usernameKey => 'username';
  static String get imageKey => 'imageUser';
  static String get tokenKey => 'accessToken';
  static String get refreshTokenKey => 'refreshToken';

  static Future<void> writeSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> readSecureData(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }
}
