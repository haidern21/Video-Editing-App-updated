/// This file will contains all the utils
/// functions related to jwt token and sharedPrefrences
///

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as https;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/constants/app_constants.dart';

class JwtUtils {
  static Future<String?> getJwtToken() async {
    // SharedPreferences prefs = sharedPreferences;
    return await SharedPreferences.getInstance()
        .then((value) => value.getString('jwtToken'));
  }

  static Future<void> setJwtToken(String jwtToken) async {
    SharedPreferences prefs = sharedPreferences;
    await prefs.setString('jwtToken', jwtToken);
  }

  static void removeJwtToken() {
    SharedPreferences prefs = sharedPreferences;
    prefs.remove('jwtToken');
  }

  static Future<void> verifyJwtTokenApi() async {
    try {
      https.Response response = await buildHttpResponse(
          '${BASE_URL}token/verify/',
          method: HttpMethod.POST,
          request: {
            'token': await getJwtToken(),
          });

      debug('Response Status code is ${response.statusCode}');
      debug('Response Body is ${response.body}');
      if (response.statusCode == 200) {
        /// Otp Send Successfully
        toast(
          jsonDecode(response.body)['detail'],
        );
      } else {
        // inspect(response.body);
        // getRefreshTokenFromApi();
      }
    } on Exception catch (e, stack) {
      debug(
        'Caught Error $e',
        stackTrace: stack,
      );
      toast('Error $e');
    }
  }

  static Future<String?> getRefreshTokenFromApi() async {
    try {
      https.Response response = await buildHttpResponse(
          '${BASE_URL}token/refresh/',
          method: HttpMethod.POST,
          request: {
            'token': getJwtToken(),
            'refresh': getJwtToken(),
          });

      debug('response.body ${response.body}');
      if (response.statusCode == 200) {
        /// Otp Send Successfully
        toast(
          jsonDecode(response.body)['detail'],
        );

        /// Redirect User to Verify OTP Screen
        ///

      } else {
        inspect(response.headers);

        /// Now we have to refresh the token
        ///

      }
    } on Exception catch (e, stack) {
      debug(
        'Caught Error $e',
        stackTrace: stack,
      );
      toast('Error $e');
    }
  }

  static String? getRefreshToken() {
    SharedPreferences prefs = sharedPreferences;
    return prefs.getString('refreshToken');
  }

  static setRefreshToken(String refreshToken) {
    SharedPreferences prefs = sharedPreferences;
    prefs.setString('refreshToken', refreshToken);
  }

  static void removeRefreshToken() {
    SharedPreferences prefs = sharedPreferences;
    prefs.remove('refreshToken');
  }

  /// Verify Jwt Token
  ///
  /// This function will verify the jwt token
  static Future<bool> verifyToken({bool isDebug = false}) async {
    String? jwtCode = await getJwtToken();
    // if (isDebug) {
    debug('Jwt Code $jwtCode');

    // inspect(Jwt.parseJwt(jwtCode!));
    // }

    if (jwtCode != null) {
      var isTokenExpired = Jwt.isExpired(jwtCode);
      if (isDebug) {
        debug('Is Token Expired: $isTokenExpired');
      }
      return !isTokenExpired;
    } else {
      return false;
    }
  }
}
