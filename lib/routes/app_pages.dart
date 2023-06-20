import 'package:get/get.dart';
import 'package:tourease/pages/Dashboard/event_detail.dart';
import 'package:tourease/pages/Dashboard/home.dart';
import 'package:tourease/pages/OptionCenter/option.dart';
import 'package:tourease/pages/Payments/Payment_page1.dart';
import 'package:tourease/pages/Payments/Payment_page2.dart';
import 'package:tourease/pages/Tutoriual/tutorial.dart';
import 'package:tourease/pages/Login/login_page.dart';
import 'package:tourease/pages/signup/signup.dart';
import 'package:tourease/pages/Splash/splash.dart';
import 'package:tourease/routes/app_routes.dart';

import '../pages/ForgotPassword/Succesfullsent.dart';
import '../pages/ForgotPassword/forgot_password.dart';

class AppPages {
  static var list = [
    GetPage(name: AppRoute.SIGNUP, page: () => const SignUp()),
    GetPage(name: AppRoute.LOGIN, page: () => const Login()),
    GetPage(name: AppRoute.SPLASH, page: () => const Splash()),
    GetPage(name: AppRoute.TUTORIAL, page: () => const Tutorial()),
    GetPage(name: AppRoute.OPTION, page: () => const Option()),
    GetPage(name: AppRoute.FORGOT_PASSWORD, page: () => const ForgotPassword()),
    GetPage(name: AppRoute.SUCCESSFULL, page: () => const SuccessfullSent()),
    GetPage(name: AppRoute.HOME, page: () => const Home()),
    GetPage(name: AppRoute.DETAIL_SCREEN, page: () => const EventDetail()),
    GetPage(name: AppRoute.PAYMENT, page: () => const Payment()),
    GetPage(name: AppRoute.PAYMENT2, page: () => const PaymentPage2()),
  ];
}
