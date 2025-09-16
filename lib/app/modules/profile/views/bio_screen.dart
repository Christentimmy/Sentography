import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentography/app/modules/profile/controllers/bio_controller.dart';
import 'package:sentography/app/resources/colors.dart';
import 'package:sentography/app/routes/app_routes.dart';
import 'package:sentography/app/widgets/custom_button.dart';
import 'package:sentography/app/widgets/custom_textfield.dart';

class BioScreen extends StatelessWidget {
  BioScreen({super.key});

  final bioController = Get.put(BioController());

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
                value: 1,
                color: AppColors.primaryColor,
                backgroundColor: Color(0xFFE5E7EB),
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
              Text(
                "Step 3 of 3",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryColor,
                ),
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
                      "Bio",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      hintText:
                          "Tell people about yourself and your creative Journey...",
                      bgColor: AppColors.primaryColor.withValues(alpha: 0.4),
                      minLines: 4,
                      maxLines: 5,
                    ),
                    Text(
                      "Be authentic and let your personality shine!",
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryColor,
                      ),
                    ),

                    SizedBox(height: 15),
                    Text(
                      "Artistic Interest",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      readOnly: true,
                      hintText: "Jazz, Abstarct art, portrait phtography",
                      bgColor: AppColors.primaryColor.withValues(alpha: 0.4),
                      minLines: 2,
                      maxLines: 3,
                    ),
                    SizedBox(height: Get.height * 0.02),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Obx(() {
                return SizedBox(
                  height: 65,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bioController.medias.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Image.file(
                                  bioController.medias[index],
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              buildMedia(bioController.medias[index]),
                              Positioned(
                                top: -8,
                                right: -8,
                                child: InkWell(
                                  onTap: () => bioController.removeMedia(index),
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              SizedBox(height: Get.height * 0.02),
              CustomButton(
                ontap: () => bioController.pickFile(),
                border: Border.all(color: AppColors.primaryColor),
                bgColor: AppColors.bgColor,
                isLoading: false.obs,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Add showcase media (optional)",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05),
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

  buildMedia(File file) {
    return Container(
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryColor),
        image: DecorationImage(image: FileImage(file), fit: BoxFit.cover),
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
