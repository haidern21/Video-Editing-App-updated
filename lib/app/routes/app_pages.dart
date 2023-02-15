// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/ForgotPassword/controllers/otp_controller_reset_password.dart';
import 'package:video_editing_app/app/modules/ForgotPassword/views/verify_password_reset_otp.dart';
import 'package:video_editing_app/app/modules/QuoteGiven/bindings/quote_given_binding.dart';
import 'package:video_editing_app/app/modules/QuoteGiven/views/quote_given_view.dart';
import 'package:video_editing_app/app/modules/SignUp/bindings/otp_binding.dart';
import 'package:video_editing_app/app/modules/SignUp/views/otp_confirmation_screen.dart';

import '../modules/AccountCreateSuccess/bindings/account_create_success_binding.dart';
import '../modules/AccountCreateSuccess/views/account_create_success_view.dart';
import '../modules/AccountSetting/bindings/account_setting_binding.dart';
import '../modules/AccountSetting/views/account_setting_view.dart';
import '../modules/AddNewCard/bindings/add_new_card_binding.dart';
import '../modules/AddNewCard/views/add_new_card_view.dart';
import '../modules/BottomBar/bindings/bottom_bar_binding.dart';
import '../modules/BottomBar/views/bottom_bar_view.dart';
import '../modules/BottomProfile/bindings/bottom_profile_binding.dart';
import '../modules/BottomProfile/views/bottom_profile_view.dart';
import '../modules/ChangePassword/bindings/change_password_binding.dart';
import '../modules/ChangePassword/views/change_password_view.dart';
import '../modules/ChatView/bindings/chat_view_binding.dart';
import '../modules/ChatView/views/chat_view_view.dart';
import '../modules/CheckOut/bindings/check_out_binding.dart';
import '../modules/CheckOut/views/check_out_view.dart';
import '../modules/Completed/bindings/completed_binding.dart';
import '../modules/Completed/views/completed_view.dart';
import '../modules/EditorAccounSuccess/bindings/editor_accoun_success_binding.dart';
import '../modules/EditorAccounSuccess/views/editor_accoun_success_view.dart';
import '../modules/EditorAddPaymentMethod/bindings/editor_add_payment_method_binding.dart';
import '../modules/EditorAddPaymentMethod/views/editor_add_payment_method_view.dart';
import '../modules/EditorAlotted/bindings/editor_alotted_binding.dart';
import '../modules/EditorAlotted/views/editor_alotted_view.dart';
import '../modules/EditorBottomBar/bindings/editor_bottom_bar_binding.dart';
import '../modules/EditorBottomBar/views/editor_bottom_bar_view.dart';
import '../modules/EditorChats/bindings/editor_chats_binding.dart';
import '../modules/EditorChats/views/editor_chats_view.dart';
import '../modules/EditorDeliver/bindings/editor_deliver_binding.dart';
import '../modules/EditorDeliver/views/editor_deliver_view.dart';
import '../modules/EditorInProgress/bindings/editor_in_progress_binding.dart';
import '../modules/EditorInProgress/views/editor_in_progress_view.dart';
import '../modules/EditorNotification/bindings/editor_notification_binding.dart';
import '../modules/EditorNotification/views/editor_notification_view.dart';
import '../modules/EditorOrders/bindings/editor_orders_binding.dart';
import '../modules/EditorOrders/views/editor_orders_view.dart';
import '../modules/EditorProfile/bindings/editor_profile_binding.dart';
import '../modules/EditorProfile/views/editor_profile_view.dart';
import '../modules/EditorProfileEdit/bindings/editor_profile_edit_binding.dart';
import '../modules/EditorProfileEdit/views/editor_profile_edit_view.dart';
import '../modules/EditorProjectDetails/bindings/project_details_binding.dart';
import '../modules/EditorProjectDetails/controllers/project_details_controller.dart';
import '../modules/EditorProjectDetails/views/project_details_view.dart';
import '../modules/EditorReward/bindings/editor_reward_binding.dart';
import '../modules/EditorReward/views/editor_reward_view.dart';
import '../modules/EditorSendMessage/bindings/editor_send_message_binding.dart';
import '../modules/EditorSendMessage/views/editor_send_message_view.dart';
import '../modules/EditorSignIn/bindings/editor_sign_in_binding.dart';
import '../modules/EditorSignIn/views/editor_sign_in_view.dart';
import '../modules/EditorSignUp/bindings/editor_sign_up_binding.dart';
import '../modules/EditorSignUp/views/editor_sign_up_view.dart';
import '../modules/EditorWithdraw/bindings/editor_withdraw_binding.dart';
import '../modules/EditorWithdraw/views/editor_withdraw_view.dart';
import '../modules/FindAnEditor/bindings/find_an_editor_binding.dart';
import '../modules/FindAnEditor/views/find_an_editor_view.dart';
import '../modules/ForgotPassword/bindings/forgot_password_binding.dart';
import '../modules/ForgotPassword/views/forgot_password_view.dart';
import '../modules/GetQuote/bindings/get_quote_binding.dart';
import '../modules/GetQuote/views/get_quote_view.dart';
import '../modules/GetQuoteEight/bindings/get_quote_eight_binding.dart';
import '../modules/GetQuoteEight/views/get_quote_eight_view.dart';
import '../modules/GetQuoteFive/bindings/get_quote_five_binding.dart';
import '../modules/GetQuoteFive/views/get_quote_five_view.dart';
import '../modules/GetQuoteFour/bindings/get_quote_four_binding.dart';
import '../modules/GetQuoteFour/views/get_quote_four_view.dart';
import '../modules/GetQuoteNine/bindings/get_quote_eight_binding.dart';
import '../modules/GetQuoteNine/controllers/get_quote_eight_controller.dart';
import '../modules/GetQuoteNine/views/get_quote_eight_view.dart';
import '../modules/GetQuoteOnTheWay/bindings/get_quote_on_the_way_binding.dart';
import '../modules/GetQuoteOnTheWay/views/get_quote_on_the_way_view.dart';
import '../modules/GetQuoteSeven/bindings/get_quote_seven_binding.dart';
import '../modules/GetQuoteSeven/views/get_quote_seven_view.dart';
import '../modules/GetQuoteSix/bindings/get_quote_six_binding.dart';
import '../modules/GetQuoteSix/views/get_quote_six_view.dart';
import '../modules/GetQuoteThree/bindings/get_quote_three_binding.dart';
import '../modules/GetQuoteThree/views/get_quote_three_view.dart';
import '../modules/GetQuoteTwo/bindings/get_quote_two_binding.dart';
import '../modules/GetQuoteTwo/views/get_quote_two_view.dart';
import '../modules/GetReward/bindings/get_reward_binding.dart';
import '../modules/GetReward/views/get_reward_view.dart';
import '../modules/GetRewardTwo/bindings/get_reward_two_binding.dart';
import '../modules/GetRewardTwo/views/get_reward_two_view.dart';
import '../modules/InProgress/bindings/in_progress_binding.dart';
import '../modules/InProgress/views/in_progress_view.dart';
import '../modules/Notifications/bindings/notifications_binding.dart';
import '../modules/Notifications/views/notifications_view.dart';
import '../modules/Order/bindings/order_binding.dart';
import '../modules/Order/views/order_view.dart';
import '../modules/OrderCompleted/bindings/order_completed_binding.dart';
import '../modules/OrderCompleted/views/order_completed_view.dart';
import '../modules/PasswordReseted/bindings/password_reseted_binding.dart';
import '../modules/PasswordReseted/views/password_reseted_view.dart';
import '../modules/PaymentAndDeposit/bindings/payment_and_deposit_binding.dart';
import '../modules/PaymentAndDeposit/views/payment_and_deposit_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/ProjectDetails/bindings/project_details_binding.dart';
import '../modules/ProjectDetails/views/project_details_view.dart';
import '../modules/Rewards/bindings/rewards_binding.dart';
import '../modules/Rewards/views/rewards_view.dart';
import '../modules/SendMessage/bindings/send_message_binding.dart';
import '../modules/SendMessage/views/send_message_view.dart';
import '../modules/SignIn/bindings/sign_in_binding.dart';
import '../modules/SignIn/views/sign_in_view.dart';
import '../modules/SignSelectection/bindings/sign_selectection_binding.dart';
import '../modules/SignSelectection/views/sign_selectection_view.dart';
import '../modules/SignUp/bindings/sign_up_binding.dart';
import '../modules/SignUp/views/sign_up_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_SELECTECTION,
      page: () => SignSelectectionView(),
      binding: SignSelectectionBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.OTP_CONFIRMATION,
      page: () => const OtpConfirmationScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_OTP_CONFIRMATION,
      page: () => const VerifyResetPasswordOtp(),
      binding: ForgotPasswordOtpBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_CREATE_SUCCESS,
      page: () => AccountCreateSuccessView(),
      binding: AccountCreateSuccessBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESETED,
      page: () => PasswordResetedView(),
      binding: PasswordResetedBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_VIEW,
      page: () => const ChatViewView(),
      binding: ChatViewBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE,
      page: () => GetQuoteView(),
      binding: GetQuoteBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_TWO,
      page: () => GetQuoteTwoView(),
      binding: GetQuoteTwoBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_THREE,
      page: () =>  GetQuoteThreeView(),
      binding: GetQuoteThreeBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_FOUR,
      page: () =>  GetQuoteFourView(),
      binding: GetQuoteFourBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_FIVE,
      page: () => const GetQuoteFiveView(),
      binding: GetQuoteFiveBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_SIX,
      page: () => const GetQuoteSixView(),
      binding: GetQuoteSixBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_SEVEN,
      page: () => const GetQuoteSevenView(),
      binding: GetQuoteSevenBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_NINE,
      page: () => GetQuoteNineView(),
      binding: GetQuoteNineBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_EIGHT,
      page: () => const GetQuoteEightView(),
      binding: GetQuoteEightBinding(),
    ),
    GetPage(
      name: _Paths.GET_QUOTE_ON_THE_WAY,
      page: () => GetQuoteOnTheWayView(),
      binding: GetQuoteOnTheWayBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAILS,
      page: () => ProjectDetailsView(),
      binding: ProjectDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_PROJECT_DETAILS,
      page: () => EditorProjectDetailsView(),
      binding: EditorProjectDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT,
      page: () => CheckOutView(),
      binding: CheckOutBinding(),
    ),
    GetPage(
      name: _Paths.QUOTE_GIVEN,
      page: () => QuoteGivenView(),
      binding: QuoteGivenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_CARD,
      page: () => AddNewCardView(),
      binding: AddNewCardBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_ALOTTED,
      page: () => EditorAlottedView(),
      binding: EditorAlottedBinding(),
    ),
    GetPage(
      name: _Paths.IN_PROGRESS,
      page: () => InProgressView(),
      binding: InProgressBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETED,
      page: () => CompletedView(),
      binding: CompletedBinding(),
    ),
    GetPage(
      name: _Paths.SEND_MESSAGE,
      page: () => SendMessageView(),
      binding: SendMessageBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_PROFILE,
      page: () =>  BottomProfileView(),
      binding: BottomProfileBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTING,
      page: () => AccountSettingView(),
      binding: AccountSettingBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_AND_DEPOSIT,
      page: () => const PaymentAndDepositView(),
      binding: PaymentAndDepositBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.REWARDS,
      page: () => RewardsView(),
      binding: RewardsBinding(),
    ),
    GetPage(
      name: _Paths.GET_REWARD,
      page: () => GetRewardView(),
      binding: GetRewardBinding(),
    ),
    GetPage(
      name: _Paths.GET_REWARD_TWO,
      page: () => GetRewardTwoView(),
      binding: GetRewardTwoBinding(),
    ),
    GetPage(
      name: _Paths.FIND_AN_EDITOR,
      page: () => FindAnEditorView(),
      binding: FindAnEditorBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_BOTTOM_BAR,
      page: () => EditorBottomBarView(),
      binding: EditorBottomBarBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_CHATS,
      page: () => const EditorChatsView(),
      binding: EditorChatsBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_PROFILE,
      page: () => EditorProfileView(),
      binding: EditorProfileBinding(),
    ),

    GetPage(
      name: _Paths.EDITOR_SIGN_UP,
      page: () => EditorSignUpView(),
      binding: EditorSignUpBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_ACCOUN_SUCCESS,
      page: () => EditorAccounSuccessView(),
      binding: EditorAccounSuccessBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_SIGN_IN,
      page: () => EditorSignInView(),
      binding: EditorSignInBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_SEND_MESSAGE,
      page: () => EditorSendMessageView(),
      binding: EditorSendMessageBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_ORDERS,
      page: () => EditorOrdersView(),
      binding: EditorOrdersBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_IN_PROGRESS,
      page: () => const EditorInProgressView(),
      binding: EditorInProgressBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_DELIVER,
      page: () => const EditorDeliverView(),
      binding: EditorDeliverBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_PROFILE_EDIT,
      page: () => EditorProfileEditView(),
      binding: EditorProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_WITHDRAW,
      page: () => const EditorWithdrawView(),
      binding: EditorWithdrawBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_ADD_PAYMENT_METHOD,
      page: () => EditorAddPaymentMethodView(),
      binding: EditorAddPaymentMethodBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_NOTIFICATION,
      page: () => EditorNotificationView(),
      binding: EditorNotificationBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_COMPLETED,
      page: () => OrderCompletedView(),
      binding: OrderCompletedBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR_REWARD,
      page: () => EditorRewardView(),
      binding: EditorRewardBinding(),
    ),
  ];
}
