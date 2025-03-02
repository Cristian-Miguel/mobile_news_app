import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:mobile_news/config/logger_config.dart';
import 'package:mobile_news/config/secure_storage.dart';
import 'package:mobile_news/core/constant/routes.dart';
import 'package:mobile_news/core/exception/network_exception.dart';
import 'package:mobile_news/core/exception/not_found_exception.dart';
import 'package:mobile_news/core/models/ResponseModel.dart';
import 'package:mobile_news/core/models/error_format.dart';
import 'package:mobile_news/features/auth/exception/account_disable_exception.dart';
import 'package:mobile_news/features/auth/exception/invalid_credantials_exception.dart';
import 'package:mobile_news/features/auth/models/sign_in.dart';
import 'package:mobile_news/features/auth/models/sign_up.dart';
import 'package:mobile_news/features/auth/models/token.dart';

class AuthService {
  Future basePost(String? body, String route) async {
    Uri url = Uri.parse(route);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    return await http.post(
      url,
      headers: headers,
      body: body,
    );
  }

  Future signIn(final SignIn signin) async {
    try {
      final response =
          await basePost(jsonEncode(signin.toJson()), Routes.signInRoute);

      if (response.statusCode == 401) {
        throw AccountDisableException('Account is disabled');
      }

      if (response.statusCode == 403) {
        throw InvalidCredantialsException('Invalid credentials');
      }

      if (response.statusCode == 500) {
        throw NetworkException('Network error');
      }

      if (response.statusCode == 200) {
        final ResponseModel<Token> token = ResponseModel<Token>.fromJson(
            jsonDecode(response.body), Token.fromJson);
        SecureStorage.writeSecureData(
            SecureStorage.tokenKey, token.data!.accessToken);
        SecureStorage.writeSecureData(
            SecureStorage.refreshTokenKey, token.data!.refreshToken);
      }

      LoggerConfig.logger.i('Sign in successful');

      return 'Sign in successful';
    } on TimeoutException catch (e) {
      return ErrorFormat(
          message: e.message ?? 'Request timeout',
          stackTrace: e.toString(),
          code: '408',
          type: 'TimeoutException');
    } on AccountDisableException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '401',
          type: 'AccountDisableException');
    } on InvalidCredantialsException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '403',
          type: 'InvalidCredantialsException');
    } on NetworkException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '500',
          type: 'NetworkException');
    }
  }

  Future signUp(final SignUp signUp) async {
    try {
      final response =
          await basePost(jsonEncode(signUp.toJson()), Routes.signUpRoute);

      if (response.statusCode == 404) {
        throw NotFoundException('Some information not found.');
      }

      if (response.statusCode == 403) {
        throw InvalidCredantialsException('Invalid credentials');
      }

      if (response.statusCode == 500) {
        throw NetworkException('Network error');
      }

      if (response.statusCode == 200) {
        final ResponseModel<Token> token = ResponseModel<Token>.fromJson(
            jsonDecode(response.body), Token.fromJson);
        await SecureStorage.deleteSecureData(SecureStorage.tokenKey);
        await SecureStorage.deleteSecureData(SecureStorage.refreshTokenKey);
      }

      LoggerConfig.logger.i('Sign up successful');

      return 'Sign up successful';
    } on TimeoutException catch (e) {
      return ErrorFormat(
          message: e.message ?? 'Request timeout',
          stackTrace: e.toString(),
          code: '408',
          type: 'TimeoutException');
    } on NotFoundException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '404',
          type: 'NotFoundException');
    } on InvalidCredantialsException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '403',
          type: 'InvalidCredantialsException');
    } on NetworkException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '500',
          type: 'NetworkException');
    }
  }

  Future signOut() async {
    try {
      final String? accessToken =
          await SecureStorage.readSecureData(SecureStorage.tokenKey);
      final String? refreshToken =
          await SecureStorage.readSecureData(SecureStorage.refreshTokenKey);

      final response = await basePost(
          jsonEncode(Token(
            accessToken: accessToken ?? '',
            refreshToken: refreshToken ?? '',
          ).toJson()),
          Routes.signOutRoute);

      if (response.statusCode == 403) {
        throw InvalidCredantialsException('Invalid credentials');
      }

      if (response.statusCode == 404) {
        throw NotFoundException('Some information not found.');
      }

      if (response.statusCode == 500) {
        throw NetworkException('Network error');
      }

      if (response.statusCode == 200) {
        await SecureStorage.deleteSecureData(SecureStorage.tokenKey);
        await SecureStorage.deleteSecureData(SecureStorage.refreshTokenKey);
      }

      LoggerConfig.logger.i('Sign out successful');

      return 'Sign out successful';
    } on TimeoutException catch (e) {
      return ErrorFormat(
          message: e.message ?? 'Request timeout',
          stackTrace: e.toString(),
          code: '408',
          type: 'TimeoutException');
    } on NotFoundException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '404',
          type: 'NotFoundException');
    } on InvalidCredantialsException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '403',
          type: 'InvalidCredantialsException');
    } on NetworkException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '500',
          type: 'NetworkException');
    }
  }

  Future refreshToken() async {
    try {
      final String? accessToken =
          await SecureStorage.readSecureData(SecureStorage.tokenKey);
      final String? refreshToken =
          await SecureStorage.readSecureData(SecureStorage.refreshTokenKey);

      final response = await await basePost(
          jsonEncode(Token(
            accessToken: accessToken ?? '',
            refreshToken: refreshToken ?? '',
          ).toJson()),
          Routes.refreshTokenRoute);

      if (response.statusCode == 403) {
        throw InvalidCredantialsException('Invalid credentials');
      }

      if (response.statusCode == 404) {
        throw NotFoundException('Some information not found.');
      }

      if (response.statusCode == 500) {
        throw NetworkException('Network error');
      }

      if (response.statusCode == 200) {
        final ResponseModel<Token> token = ResponseModel<Token>.fromJson(
            jsonDecode(response.body), Token.fromJson);
        await SecureStorage.deleteSecureData(SecureStorage.tokenKey);
        await SecureStorage.deleteSecureData(SecureStorage.refreshTokenKey);
        SecureStorage.writeSecureData(
            SecureStorage.tokenKey, token.data!.accessToken);
        SecureStorage.writeSecureData(
            SecureStorage.refreshTokenKey, token.data!.refreshToken);
      }

      LoggerConfig.logger.i('Refresh token successful');

      return 'Refresh successful';
    } on TimeoutException catch (e) {
      return ErrorFormat(
          message: e.message ?? 'Request timeout',
          stackTrace: e.toString(),
          code: '408',
          type: 'TimeoutException');
    } on NotFoundException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '404',
          type: 'NotFoundException');
    } on InvalidCredantialsException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '403',
          type: 'InvalidCredantialsException');
    } on NetworkException catch (e) {
      return ErrorFormat(
          message: e.message,
          stackTrace: e.toString(),
          code: '500',
          type: 'NetworkException');
    }
  }
}
