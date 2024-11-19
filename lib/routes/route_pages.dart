
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/views/guest/Message/media_screen.dart';
import 'package:shower_share/views/guest/Message/message_chat_screen.dart';
import 'package:shower_share/views/guest/Message/profile_about_screen.dart';
import 'package:shower_share/views/guest/Message/report_screen.dart';
import 'package:shower_share/views/guest/auth/email_verify_screen.dart';
import 'package:shower_share/views/guest/auth/otp_verification_screen.dart';
import 'package:shower_share/views/guest/auth/reset_pass_screen.dart';
import 'package:shower_share/views/guest/auth/sign_in_screen.dart';
import 'package:shower_share/views/guest/auth/sign_up_screen.dart';
import 'package:shower_share/views/guest/custom_nav_bar/custom_nav_bar.dart';
import 'package:shower_share/views/guest/home/home_screen.dart';
import 'package:shower_share/views/guest/notification/notification.dart';
import 'package:shower_share/views/guest/payment/payment_details.dart';
import 'package:shower_share/views/guest/profile/profile%20details/profile_details_screen.dart';
import 'package:shower_share/views/guest/profile/profile%20details/profile_edit_details.dart';
import 'package:shower_share/views/guest/profile/setting/about_us_screen.dart';
import 'package:shower_share/views/guest/profile/setting/change%20pass/change_pass_screen.dart';
import 'package:shower_share/views/guest/profile/setting/privacy_policy_screen.dart';
import 'package:shower_share/views/guest/profile/setting/setting_screen.dart';
import 'package:shower_share/views/guest/profile/setting/terms_screen.dart';
import 'package:shower_share/views/guest/profile/support/support_screen.dart';
import 'package:shower_share/views/host/custom_nav_bar/host_custom_nav_bar.dart';
import 'package:shower_share/views/host/registration/registration_screen.dart';
import 'package:shower_share/views/splash/onboarding_screen.dart';
import 'package:shower_share/views/splash/role_screen.dart';
import 'package:shower_share/views/splash/select_screen.dart';
import 'package:shower_share/views/splash/splash_screen.dart';



class RoutePages {
  static List<GetPage<dynamic>>? routes = [

    GetPage(name: RouteNames.splashScreen, page: () =>const SplashScreen()),
    GetPage(name: RouteNames.onboardingScreen, page: () =>const OnboardingScreen()),
    GetPage(name: RouteNames.roleScreen, page: () =>const RoleScreen()),
    GetPage(name: RouteNames.selectScreen, page: () =>const SelectScreen()),
    GetPage(name: RouteNames.signInScreen, page: () =>const SignInScreen()),
    GetPage(name: RouteNames.singUpScreen, page: () =>const SignUpScreen()),
    GetPage(name: RouteNames.emailVerifyScreen, page: () =>const EmailVerifyScreen()),
    GetPage(name: RouteNames.otpVerificationScreen, page: () =>const OtpVerificationScreen()),
    GetPage(name: RouteNames.resetPassScreen, page: () =>const ResetPassScreen()),
    GetPage(name: RouteNames.customNavBar, page: () =>const CustomNavBar()),
     GetPage(name: RouteNames.homeScreen, page: () =>const HomeScreen()),
     GetPage(name: RouteNames.paymentDetails, page: () =>const PaymentDetails()),
     GetPage(name: RouteNames.profileDetailsScreen, page: () => const ProfileDetailsScreen()),
     GetPage(name: RouteNames.profileEditDetails, page: () => ProfileEditDetails()),
     GetPage(name: RouteNames.settingScreen, page: () => const SettingScreen()),
     GetPage(name: RouteNames.changePassScreen, page: () => const ChangePassScreen()),
     GetPage(name: RouteNames.termsScreen, page: () => const TermsScreen()),
     GetPage(name: RouteNames.privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
     GetPage(name: RouteNames.aboutUsScreen, page: () => const AboutUsScreen()),
     GetPage(name: RouteNames.supportScreen, page: () => const SupportScreen()),

     GetPage(name: RouteNames.messageChatScreen, page: () =>  const MessageChatScreen()),
     GetPage(name: RouteNames.profileAboutScreen, page: () =>  ProfileAboutScreen()),
     GetPage(name: RouteNames.mediaScreen, page: () =>  MediaScreen()),
     GetPage(name: RouteNames.reportScreen, page: () =>  const ReportScreen()),
     GetPage(name: RouteNames.notificationScreen, page: () =>  const NotificationScreen()),



    //host
     GetPage(name: RouteNames.registrationScreen, page: () =>   RegistrationScreen()),
     GetPage(name: RouteNames.hostCustomNavBar, page: () =>   HostCustomNavBar()),

  ];
}