import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sentography/app/resources/colors.dart';
import 'package:sentography/app/routes/app_routes.dart';
import 'package:sentography/app/utils/image_picker.dart';
import 'package:sentography/app/widgets/custom_button.dart';
import 'package:sentography/app/widgets/custom_textfield.dart';

class UploadProfileScreen extends StatelessWidget {
  UploadProfileScreen({super.key});

  final Rx<File?> selectedImage = Rx<File?>(null);
  final Rx<DateTime?> selectedAge = Rx<DateTime?>(null);

  void selectImage() async {
    final im = await pickImage();
    if (im == null) return;
    selectedImage.value = im;
  }

  void showDate() async {
    final selectedDate = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (selectedDate == null) return;
    selectedAge.value = selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView(
            children: [
              LinearProgressIndicator(
                value: 0.3,
                color: AppColors.primaryColor,
                backgroundColor: Color(0xFFE5E7EB),
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
              Text(
                "Step 1 of 3",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Center(
                child: Obx(() {
                  return InkWell(
                    onTap: () => selectImage(),
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 50,
                      backgroundImage: selectedImage.value != null
                          ? FileImage(selectedImage.value!)
                          : null,
                      child: selectedImage.value != null
                          ? SizedBox.shrink()
                          : Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  );
                }),
              ),
              SizedBox(height: Get.height * 0.06),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Full Name",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      hintText: "Enter your full name",
                      prefixIcon: Icons.person,
                      bgColor: AppColors.primaryColor.withValues(alpha: 0.4),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Age",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Obx(() {
                      String dob = '';
                      if (selectedAge.value != null) {
                        dob = DateFormat(
                          'dd MMM yyyy',
                        ).format(selectedAge.value!);
                      } else {
                        dob = "Click to select your age";
                      }
                      return CustomTextField(
                        readOnly: true,
                        hintText: dob,
                        prefixIcon: Icons.person,
                        bgColor: AppColors.primaryColor.withValues(alpha: 0.4),
                        onTap: () => showDate(),
                      );
                    }),
                    SizedBox(height: 15),
                    Text(
                      "Location",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      readOnly: true,
                      hintText: "Click to select your location",
                      prefixIcon: Icons.person,
                      bgColor: AppColors.primaryColor.withValues(alpha: 0.4),
                    ),
                    SizedBox(height: Get.height * 0.02),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.1),
              CustomButton(
                isLoading: false.obs,
                ontap: () => Get.toNamed(AppRoutes.hobby),
                child: Text(
                  "Next",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.bgColor,
      leading: InkWell(
        onTap: () => Get.back(),
        child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
      ),
      title: Text(
        "Basic Info",
        style: GoogleFonts.inter(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
