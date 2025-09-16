import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentography/app/resources/colors.dart';
import 'package:sentography/app/routes/app_routes.dart';
import 'package:sentography/app/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/sentLogo.png',
                  width: 180,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Meet creatives,Fall in love through art",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Connect with artists, musicians, writers, and creators who share your passion for creativity and\nauthentic connections.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIcon(icon: Icons.edit),
                  buildIcon(icon: Icons.strikethrough_s),
                  buildIcon(icon: Icons.camera),
                  buildIcon(icon: Icons.music_note),
                ],
              ),
              SizedBox(height: 20),
              buildTile(text: "Showcase your creative work"),
              buildTile(text: "Find meaningful connections"),
              buildTile(text: "Match with like-minded artists"),
              SizedBox(height: Get.height * 0.1),
              CustomButton(
                ontap: () {
                  Get.toNamed(AppRoutes.login);
                },
                isLoading: false.obs,
                child: Text(
                  "Get Started",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTile({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 4, backgroundColor: AppColors.primaryColor),
        SizedBox(width: 10),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  buildIcon({required IconData icon}) {
    return Container(
      width: 65,
      height: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Icon(icon, color: AppColors.primaryColor),
    );
  }
}
