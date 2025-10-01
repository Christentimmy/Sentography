import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentography/app/resources/colors.dart';
import 'package:sentography/app/routes/app_routes.dart';
import 'package:sentography/app/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  final RxBool showSent = false.obs;
  final RxBool showDistance = false.obs;
  final RxBool showLastSeen = false.obs;
  final RxBool showIncognito = false.obs;

  final RxBool newMatches = false.obs;
  final RxBool messages = false.obs;
  final RxBool likes = false.obs;
  final RxBool superLikes = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.primaryColor.withValues(
                  alpha: 0.9,
                ),
                labelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                tabs: [
                  Tab(text: "Profile"),
                  Tab(text: "Settings"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    buildProfileSection(),
                    ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Account",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  "Phone Number",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Text(
                                  "+66 812345678",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  "Email",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Text(
                                  "akaza@gmail.com",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Discovery",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),

                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  "Show me on Sentography",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: showSent.value,
                                      onChanged: (value) {
                                        showSent.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(height: 15),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  "Distance",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Text(
                                  "25 miles",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  "Age-Range",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Text(
                                  "22-25",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                  "Looking For",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Text(
                                  "Everyone",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              CustomButton(
                                ontap: () {},
                                isLoading: false.obs,
                                bgColor: AppColors.bgColor,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                child: Text(
                                  "Edit Preferences",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Privacy",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "Show distance",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                subtitle: Text(
                                  "Let others see how far away you are",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: showDistance.value,
                                      onChanged: (value) {
                                        showDistance.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "Show last seen",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                subtitle: Text(
                                  "Let others see when you were last active",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: showLastSeen.value,
                                      onChanged: (value) {
                                        showLastSeen.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "Incognito mode",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                subtitle: Text(
                                  "Only people you like can see your profile",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: showIncognito.value,
                                      onChanged: (value) {
                                        showIncognito.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(height: 15),
                              CustomButton(
                                ontap: () {},
                                isLoading: false.obs,
                                bgColor: AppColors.bgColor,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                child: Text(
                                  "Edit Preferences",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Notifications",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "New matches",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: newMatches.value,
                                      onChanged: (value) {
                                        newMatches.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "Messages",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),

                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: messages.value,
                                      onChanged: (value) {
                                        messages.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "Likes",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),

                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: likes.value,
                                      onChanged: (value) {
                                        likes.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  "Super Likes",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),

                                trailing: Obx(() {
                                  return Transform.scale(
                                    scale: 0.7,
                                    child: Switch(
                                      activeColor: AppColors.primaryColor,
                                      value: superLikes.value,
                                      onChanged: (value) {
                                        superLikes.value = value;
                                      },
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        CustomButton(
                          ontap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          isLoading: false.obs,
                          bgColor: AppColors.bgColor,
                          border: Border.all(color: Colors.red),
                          child: Text(
                            "Logout",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        CustomButton(
                          ontap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          isLoading: false.obs,
                          bgColor: AppColors.bgColor,
                          border: Border.all(color: Colors.red),
                          child: Text(
                            "Delete Account",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileSection() {
    return ListView(
      children: [
        SizedBox(height: 10),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.primaryColor,
                child: Text("T", style: GoogleFonts.inter(color: Colors.white)),
              ),
              SizedBox(height: 3),
              Text(
                "Jordan, 25",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                "San Francisco, CA",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chip(
                    backgroundColor: AppColors.primaryColor,
                    label: Row(
                      children: [
                        Icon(Icons.library_music_rounded, color: Colors.white),
                        SizedBox(width: 2),
                        Text(
                          "Singer",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Chip(
                    backgroundColor: AppColors.bgColor,
                    label: Row(
                      children: [
                        Icon(Icons.verified, color: Colors.blue),
                        SizedBox(width: 2),
                        Text(
                          "Verified",
                          style: GoogleFonts.inter(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
        SizedBox(height: 15),
        buildProfileStat(),
        SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "About",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.edit, color: AppColors.primaryColor),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Showcase",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.upload, color: AppColors.primaryColor),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4E7FD),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/musicNote.png',
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xFFE0EAFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/musicNote2.png',
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        buildPremiumCard(),
      ],
    );
  }

  Widget buildPremiumCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E7),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFFDB750), width: 1),
      ),
      child: Column(
        children: [
          // Crown icon
          FaIcon(
            FontAwesomeIcons.crown,
            size: 50,
            color: const Color(0xFFFDB750),
          ),
          const SizedBox(height: 10),

          // Main title
          Text(
            'Upgrade to premium',
            style: GoogleFonts.inter(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF894B00),
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Get unlimited swipes, see who likes you, and boost your profile',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Color(0xFFA65F00),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Upgrade button
          CustomButton(
            ontap: () {},
            borderRadius: BorderRadius.circular(15),
            text: 'Upgrade to premium',
            bgColor: const Color(0xFFFDB750),
            textColor: Colors.white,
            isLoading: false.obs,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.crown, size: 20, color: Colors.white),
                const SizedBox(width: 12),
                const Text(
                  'Upgrade to premium',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildProfileStat() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: Get.width * 0.2,
          height: Get.height * 0.1,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "100",
                style: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Likes",
                style: GoogleFonts.inter(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        Container(
          width: Get.width * 0.2,
          height: Get.height * 0.1,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "8",
                style: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Chats",
                style: GoogleFonts.inter(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        Container(
          width: Get.width * 0.2,
          height: Get.height * 0.1,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "28",
                style: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Matches",
                style: GoogleFonts.inter(color: AppColors.primaryColor),
              ),
            ],
          ),
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
        "Profile",
        style: GoogleFonts.inter(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
