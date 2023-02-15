// import 'package:nb_utils/nb_utils.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:http/src/response.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/constants/api_endpoints_constants.dart';

Future<void> sendOTPRequest(String phoneNumber) async {
  try {
    Response response = await buildHttpResponse(createSignupOTPEndpoint,
        method: HttpMethod.POST,
        request: {
          'phone_number': phoneNumber,
        });

    breadcrumb();
    if (response.statusCode == 200) {
      /// Otp Send Successfully
      toast(
        jsonDecode(response.body)['detail'],
      );

      /// Redirect User to Verify OTP Screen
      ///

    } else {
      inspect(response.headers);
      toast(jsonDecode(response.body)['detail']);
    }
  } on Exception catch (e, stack) {
    debug(
      'Caught Error $e',
      stackTrace: stack,
    );
    toast('Error $e');
  }
}
