

import 'package:get/get.dart';
import 'package:sentography/app/modules/auth/views/login_screen.dart';
import 'package:sentography/app/modules/auth/views/signup_screen.dart';
import 'package:sentography/app/modules/profile/upload_profile_screen.dart';
import 'package:sentography/app/modules/splash/splash_screen.dart';
import 'package:sentography/app/modules/welcome/welcome_screen.dart';
import 'package:sentography/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: AppRoutes.uploadProfile,
      page: () => UploadProfileScreen(),
    ),
  ];
}