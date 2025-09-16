import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentography/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  late Animation<double> fadeAnimation;

  // final userController = Get.find<UserController>();
  // final socketController = Get.find<SocketController>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: -50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.bounceOut),
      ),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    Future.delayed(const Duration(seconds: 3), () async {
      // final userController = Get.find<UserController>();
      // final socketController = Get.find<SocketController>();
      // final storageController = Get.find<StorageController>();

      // bool newUser = await storageController.getUserStatus();
      // if (newUser) {
      //   Get.offAll(AppRoutes.onboarding);
      //   await storageController.saveStatus("notNewAgain");
      //   return;
      // }
      // String? token = await storageController.getToken();
      // if (token == null || token.isEmpty) {
      //   Get.offAllNamed(AppRoutes.login);
      //   return;
      // }
      Get.toNamed(AppRoutes.welcome);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _bounceAnimation.value),
              child: Opacity(
                opacity: fadeAnimation.value,
                child: Image.asset(
                  'assets/images/sentLogo.png',
                  width: Get.width * 0.5,
                  height: Get.height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
