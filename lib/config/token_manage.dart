import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile_news/config/secure_storage.dart';

class TokenManage {
  Future<bool> isTokenExpired() async {
    final String? token =
        await SecureStorage.readSecureData(SecureStorage.tokenKey);

    if (token == null) {
      return true;
    }

    return JwtDecoder.isExpired(token);
  }

  Future<void> signout() async {
    await SecureStorage.deleteSecureData(SecureStorage.tokenKey);
    await SecureStorage.deleteSecureData(SecureStorage.refreshTokenKey);
    await SecureStorage.deleteSecureData(SecureStorage.usernameKey);
    await SecureStorage.deleteSecureData(SecureStorage.imageKey);
  }
}
