import 'package:video_editing_app/constants/app_constants.dart';

const String signupUserEndpoint = '${BASE_URL}authentication/users/';

const String getUserProfileEndpoint = '${BASE_URL}authentication/users/me/';
const String getEditorProfileEndpoint = '${BASE_URL}authentication/editor-profile/';

const String passwordResetOtpEndpoint =
    '${BASE_URL}authentication/users/password-reset-otp/';

const String passwordResetEndpoint =
    '${BASE_URL}authentication/users/reset-password/';

const String passwordResetOtpVerifyEndpoint =
    '${BASE_URL}authentication/users/password-reset-otp-verify/';

const String loginUserEndpoint = '${BASE_URL}token/';
const String createQuoteEndPoints = '${BASE_URL}projects/quotes/';

/// This will send 6 digits .. needs [phone_number] in body with
///
/// request type [http.POST]
const String createSignupOTPEndpoint =
    '${BASE_URL}authentication/users/signup-otp/';

/// needs ```dart
/// {
///  "code": "string",
///  "phone_number": "string",
/// }``` in [http.post] body , when this is Succeffuly Send post Request to
///
/// [signupUserEndpoint] with body
///
/// ```{
///  "name": "string",
///  "email": "user@example.com",
///  "phone_number": "string",
///  "password": "string",
/// }
const String signupOTPVerifyEndpoint =
    '${BASE_URL}authentication/users/signup-otp-verify/';

const String getCategories = '${BASE_URL}projects/categories/';
const String getPackageForCategory = '${BASE_URL}projects/2/packages/';
const String getAllOrdersEndpoints = '${BASE_URL}projects/quotes/';
const String getAllThreadsEndpoint = '${BASE_URL}chat/threads/';
const String getAllQuoteCommunicationEndpoints = '${BASE_URL}projects/quotes/';
const String getChatThreads = '${BASE_URL}chat/threads/';
const String getEditorOrdersEndpoints =
    '${BASE_URL}projects/quotes/assigned-orders/';
