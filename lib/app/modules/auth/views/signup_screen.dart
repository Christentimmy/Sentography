import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentography/app/resources/colors.dart';
import 'package:sentography/app/routes/app_routes.dart';
import 'package:sentography/app/widgets/custom_button.dart';
import 'package:sentography/app/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final RxBool isPasswordVisible = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView(
            children: [
              SizedBox(height: Get.height * 0.02),
              Center(
                child: Image.asset(
                  'assets/images/sentLogo.png',
                  width: 180,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Center(
                child: Text(
                  "Register to your account",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Fill the following essential details to\ngetting registered.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: Get.height * 0.05),
              Text(
                "Email",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              CustomTextField(
                hintText: "Enter your email",
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 20),
              Text(
                "Phone Number",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              CustomTextField(
                hintText: "Enter your number",
                prefixIcon: Icons.phone,
              ),
              SizedBox(height: 20),
              Text(
                "Password",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Obx(() {
                return CustomTextField(
                  hintText: "Enter password",
                  prefixIcon: Icons.lock,
                  suffixIcon: isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixTap: () {
                    isPasswordVisible.value = !isPasswordVisible.value;
                  },
                );
              }),
              SizedBox(height: Get.height * 0.02),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: AppColors.primaryColor,
                    visualDensity: VisualDensity.compact,
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree to ",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Sentography ",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: "terms and conditions ",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Learn more",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              CustomButton(
                ontap: () {},
                isLoading: false.obs,
                child: Text(
                  "Register",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 10),
                  Text(
                    "OR",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildSocialButtons(icon: FontAwesomeIcons.google),
                  buildSocialButtons(icon: FontAwesomeIcons.facebook),
                  buildSocialButtons(icon: FontAwesomeIcons.apple),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocialButtons({required IconData icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: FaIcon(icon),
      ),
    );
  }
}
