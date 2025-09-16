import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentography/app/resources/colors.dart';
import 'package:sentography/app/routes/app_routes.dart';
import 'package:sentography/app/widgets/custom_button.dart';

class HobbyScreen extends StatelessWidget {
  HobbyScreen({super.key});

  final List hobbies = [
    {"icon": Icons.music_note, "title": "Music"},
    {"icon": Icons.palette, "title": "Visual Art"},
    {"icon": Icons.camera, "title": "Photography"},
    {"icon": FontAwesomeIcons.signature, "title": "Writing"},
    {"icon": FontAwesomeIcons.microchip, "title": "Tech"},
    {"icon": FontAwesomeIcons.gauge, "title": "Perfomance"},
    {"icon": FontAwesomeIcons.video, "title": "Film Video"},
  ];

  final List roles = [
    "Singer",
    "Producer",
    "Song Writer",
    "DJ",
    "Musician",
    "Sound Engineer",
  ];

  final selectedHobby = "".obs;
  final selectedrole = [].obs;

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
              LinearProgressIndicator(
                value: 0.6,
                color: AppColors.primaryColor,
                backgroundColor: Color(0xFFE5E7EB),
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
              Text(
                "Step 2 of 3",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Text(
                "What is your creative field",
                style: GoogleFonts.inter(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              GridView.builder(
                shrinkWrap: true,
                itemCount: hobbies.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.2,
                ),
                itemBuilder: (context, index) {
                  final data = hobbies[index];
                  return InkWell(
                    onTap: () {
                      selectedHobby.value = data["title"];
                    },
                    child: Obx(() {
                      return Container(
                        decoration: BoxDecoration(
                          color: selectedHobby.value == data["title"]
                              ? AppColors.primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              data["icon"],
                              color: selectedHobby.value == data["title"]
                                  ? Colors.white
                                  : AppColors.primaryColor,
                              size: 30,
                            ),
                            Text(
                              data["title"],
                              style: GoogleFonts.inter(
                                color: selectedHobby.value == data["title"]
                                    ? Colors.white
                                    : AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: Get.height * 0.05),

              Obx(() {
                return AnimatedCrossFade(
                  duration: Duration(milliseconds: 300),
                  firstChild: SizedBox.shrink(),
                  secondChild: buildRoles(),
                  crossFadeState: selectedHobby.value.isEmpty
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                );
              }),
              SizedBox(height: Get.height * 0.03),
              CustomButton(
                ontap: () {
                  if (selectedHobby.value.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please select a hobby",
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.toNamed(AppRoutes.bio);
                  }
                },
                isLoading: false.obs,
                child: Text(
                  "Continue",
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

  Widget buildRoles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select your roles (choose multiple)",
          style: GoogleFonts.inter(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Get.height * 0.01),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: roles.map((e) {
            return Obx(() {
              return InkWell(
                onTap: () {
                  if (selectedrole.contains(e)) {
                    selectedrole.remove(e);
                  } else {
                    selectedrole.add(e);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: selectedrole.contains(e)
                        ? AppColors.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Text(
                    e,
                    style: GoogleFonts.inter(
                      color: selectedrole.contains(e)
                          ? Colors.white
                          : AppColors.primaryColor,
                    ),
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ],
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
