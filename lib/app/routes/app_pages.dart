import 'package:get/get.dart';
import 'package:sentography/app/modules/auth/views/login_screen.dart';
import 'package:sentography/app/modules/auth/views/signup_screen.dart';
import 'package:sentography/app/modules/chat/views/chatlist_screen.dart';
import 'package:sentography/app/modules/chat/views/message_screen.dart';
import 'package:sentography/app/modules/favourite/views/favourite_screen.dart';
import 'package:sentography/app/modules/favourite/views/matches_screen.dart';
import 'package:sentography/app/modules/home/views/home_screen.dart';
import 'package:sentography/app/modules/profile/views/bio_screen.dart';
import 'package:sentography/app/modules/profile/views/hobby_screen.dart';
import 'package:sentography/app/modules/profile/views/preference_screen.dart';
import 'package:sentography/app/modules/profile/views/upload_profile_screen.dart';
import 'package:sentography/app/modules/splash/splash_screen.dart';
import 'package:sentography/app/modules/welcome/welcome_screen.dart';
import 'package:sentography/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.welcome, page: () => const WelcomeScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => SignupScreen()),
    GetPage(name: AppRoutes.uploadProfile, page: () => UploadProfileScreen()),
    GetPage(name: AppRoutes.hobby, page: () => HobbyScreen()),
    GetPage(name: AppRoutes.bio, page: () => BioScreen()),
    GetPage(name: AppRoutes.preference, page: () => PreferenceScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.favourite, page: () => FavoriteScreen()),
    GetPage(name: AppRoutes.matches, page: () => MatchesScreen()),
    GetPage(name: AppRoutes.chatList, page: () => ChatListScreen()),
    GetPage(name: AppRoutes.message, page: () => MessageScreen()),
  ];
}
