import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentography/app/resources/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final appinioSwiperController = AppinioSwiperController();
  final List<String> images = [
    "assets/images/pic1.jpeg",
    "assets/images/pic2.jpg",
    "assets/images/pic3.jpg",
    "assets/images/pic4.jpg",
    "assets/images/pic5.jpg",
    "assets/images/pic6.jpg",
    "assets/images/pic7.jpg",
    "assets/images/pic8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.04),
              Text(
                "Discovery",
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppinioSwiper(
                      controller: appinioSwiperController,
                      cardCount: images.length,
                      backgroundCardCount: 2,
                      backgroundCardOffset: Offset(0, 0),
                      onSwipeEnd: (previousIndex, targetIndex, activity) {
                        // Get.toNamed(AppRoutes.match);
                      },
                      loop: true,
                      cardBuilder: (context, index) {
                        final image = images[index];
                        return buildCard(image: image);
                      },
                    ),
                    Positioned(bottom: -35, child: buildActionButtons()),
                  ],
                ),
              ),

              SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Row buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildActionButton(
          icon: FontAwesomeIcons.xmark,
          onTap: () {
            appinioSwiperController.swipeLeft();
          },
        ),
        buildActionButton(
          bgColor: Colors.white,
          showBorder: true,
          iconColor: AppColors.primaryColor,
          icon: FontAwesomeIcons.solidStar,
          onTap: () {
            appinioSwiperController.swipeRight();
          },
        ),
        buildActionButton(
          icon: FontAwesomeIcons.solidHeart,
          onTap: () {
            appinioSwiperController.swipeRight();
          },
        ),
      ],
    );
  }

  Widget buildCard({required String image}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Maya, 23",
                              style: GoogleFonts.figtree(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.verified, size: 20, color: Colors.blue),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white),
                            Text(
                              "5 miles away",
                              style: GoogleFonts.figtree(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // CustomButton(
                            //   ontap: () {},
                            //   height: Get.,
                            //   bgColor: Color(0xFFF2EDEC),
                            //   isLoading: false.obs,
                            //   child: Text(
                            //     "Message",
                            //     style: GoogleFonts.figtree(
                            //       fontSize: 15,
                            //       fontWeight: FontWeight.w600,
                            //       color: AppColors.primaryColor,
                            //     ),
                            //   ),
                            // ),
                            Chip(
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.music_note, size: 13),
                                  SizedBox(width: 5),
                                  Text(
                                    "Singer",
                                    style: GoogleFonts.figtree(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 30,
                top: 10,
                bottom: 70,
              ),
              child: Text(
                "jazz vocalist with a passion for storytelling through music Looking for someone whoappreciate the arts,of improvisation in life and love",
                style: GoogleFonts.figtree(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  // color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButton({
    required IconData icon,
    VoidCallback? onTap,
    Color? bgColor,
    Color? iconColor,
    bool showBorder = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: showBorder ? Get.height * 0.17 : Get.height * 0.13,
        width: showBorder ? Get.width * 0.17 : Get.width * 0.13,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: showBorder
              ? Border.all(color: AppColors.primaryColor, width: 2)
              : null,
          color: bgColor ?? AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor ?? Colors.white),
      ),
    );
  }
}
