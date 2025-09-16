

import 'package:get/get.dart';
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
  ];
}