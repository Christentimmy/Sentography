import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentography/app/resources/colors.dart';
import 'package:sentography/app/widgets/custom_button.dart';

class PreferenceScreen extends StatelessWidget {
  PreferenceScreen({super.key});

  final preference = "".obs;
  final gender = "".obs;
  final Rx<RangeValues> ageRange = RangeValues(18, 80).obs;
  final maxDistance = 10.0.obs;

  final RxBool showVerified = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: Get.height * 0.05),
              Container(
                width: Get.width,
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
                      "Preference",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => buildTile(
                        text: "Looking for love",
                        isSelected: preference.value == "Looking for love",
                        onTap: () => preference.value = "Looking for love",
                      ),
                    ),
                    Obx(
                      () => buildTile(
                        text: "Serious relationship",
                        isSelected: preference.value == "Serious relationship",
                        onTap: () => preference.value = "Serious relationship",
                      ),
                    ),
                    Obx(
                      () => buildTile(
                        text: "Casual Dating",
                        isSelected: preference.value == "Casual Dating",
                        onTap: () => preference.value = "Casual Dating",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Container(
                width: Get.width,
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
                      "Show me",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Obx(
                      () => buildTile(
                        text: "Men",
                        isSelected: gender.value == "Men",
                        onTap: () => gender.value = "Men",
                      ),
                    ),
                    Obx(
                      () => buildTile(
                        text: "Women",
                        isSelected: gender.value == "Women",
                        onTap: () => gender.value = "Women",
                      ),
                    ),
                    Obx(
                      () => buildTile(
                        text: "Everyone",
                        isSelected: gender.value == "Everyone",
                        onTap: () => gender.value = "Everyone",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Container(
                width: Get.width,
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
                      "Age Range",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              "${ageRange.value.start.round().toString()} years old",
                            ),
                          ),
                          Spacer(),
                          Obx(
                            () => Text(
                              "${ageRange.value.end.round().toString()} years old",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return RangeSlider(
                        values: ageRange.value,
                        min: 18,
                        max: 80,
                        onChanged: (value) => ageRange.value = value,
                        activeColor: AppColors.primaryColor,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Container(
                width: Get.width,
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
                      "Maximum Distance",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              "${maxDistance.value.round().toString()} miles away",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Slider(
                        value: maxDistance.value,
                        min: 1.0,
                        max: 150.0,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) => maxDistance.value = value,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Container(
                width: Get.width,
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
                      "Additional Settings",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Show only verified artist",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text("25 miles away"),
                      trailing: Obx(
                        () => Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            activeColor: AppColors.primaryColor,
                            value: showVerified.value,
                            onChanged: (value) => showVerified.value = value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              CustomButton(
                ontap: () {},
                isLoading: false.obs,
                child: Text(
                  "Start Discovering",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text("You can always change these preferences later in settings"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTile({
    required String text,
    VoidCallback? onTap,
    required bool isSelected,
    String? subTitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? AppColors.primaryColor : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.primaryColor,
          ),
        ),
        onTap: onTap,
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
