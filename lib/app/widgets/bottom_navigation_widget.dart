import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sentography/app/modules/chat/views/chatlist_screen.dart';
import 'package:sentography/app/modules/favourite/views/favourite_screen.dart';
import 'package:sentography/app/modules/favourite/views/matches_screen.dart';
import 'package:sentography/app/modules/home/views/home_screen.dart';
import 'package:sentography/app/modules/profile/views/profile_screen.dart';
import 'package:sentography/app/resources/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key});

  final List<Widget> pages = [
    HomeScreen(),
    FavoriteScreen(),
    MatchesScreen(),
    ChatListScreen(),
    ProfileScreen(),
  ];

  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0F0D15),
      body: Obx(() => pages[currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primaryColor,
          // backgroundColor: Color(0xFF0F0D15),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.compass), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.thumb_up_alt), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          currentIndex: currentIndex.value,
          onTap: (index) => currentIndex.value = index,
        ),
      ),
    );
  }
}
