import 'package:flutter/material.dart';
import 'package:news/core/styles/color.dart';
import 'package:news/features/home_screen/home_screen.dart';
import 'package:news/features/notifications/notifications.dart';
import 'package:news/features/save_screen/save_screen.dart';
import 'package:news/features/setting_screen/setting_screen.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int index = 0;

  List<Widget> screens = [
    HomeScreen(),
    SaveScreen(),
    SettingScreen(),
    Notifications()
  ];

  void onTap(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: onTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme:
              IconThemeData(color: AppColors.lightIconsColor, size: 28),
          unselectedIconTheme:
              IconThemeData(color: AppColors.lightSecondTextColor, size: 24),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), label: "Save"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notifications")
          ]),
    );
  }
}
