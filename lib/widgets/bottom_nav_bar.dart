import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nextflix_app/screens/screen_new.dart';

import '../screens/screen_home.dart';
import '../screens/user.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          child: NavigationBar(
            indicatorColor: Colors.transparent, // Remove unwanted indicator
            backgroundColor: Color(0xff212121),
            height: 72,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
            controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(
                icon: controller.selectedIndex.value == 0 ?Icon(Icons.home, color: Colors.white,) : Icon(Icons.home_outlined, color: Colors.grey,),
                label: 'Home',
              ),
              NavigationDestination(
                icon: controller.selectedIndex.value == 1 ?Icon(Icons.video_collection, color: Colors.white,) : Icon(Icons.video_collection_outlined, color: Colors.grey,),
                label: 'New & Hot',
              ),
              NavigationDestination(
                icon: controller.selectedIndex.value == 2 ?Icon(Icons.person, color: Colors.white,) : Icon(Icons.person_2_outlined, color: Colors.grey,),
                label: 'My Nextflix',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(), NewAndHotScreen(), UserScreen()];
  final icons = [
    CupertinoIcons.home, // List of icons
    CupertinoIcons.film,
    CupertinoIcons.person,
  ].obs;
  final labels = [ // List of labels
    'Home',
    'New & Hot',
    'Coming soon',
  ].obs;
}
