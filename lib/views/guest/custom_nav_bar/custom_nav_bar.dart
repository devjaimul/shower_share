import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shower_share/utils/app_colors.dart';
import 'package:shower_share/utils/app_icons.dart';
import 'package:shower_share/views/guest/Message/message_screen.dart';
import 'package:shower_share/views/guest/home/home_screen.dart';
import 'package:shower_share/views/guest/profile/profile_screen.dart';
import 'package:shower_share/views/guest/shower/shower_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    const HomeScreen(),
    const ShowerScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.buttonSecondColor, // Light blue background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          mouseCursor: MouseCursor.uncontrolled,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: AppColors.buttonSecondColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.yellowColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedLabelStyle:
              TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          items: [
            _buildNavItem(
              index: 0,
              icon: AppIcons.navHome,
              selectedIcon: AppIcons.navHomeFill,
              label: 'Home',
            ),
            _buildNavItem(
              index: 1,
              icon: AppIcons.navShower,
              selectedIcon: AppIcons.navShowerFill,
              label: 'Shower',
            ),
            _buildNavItem(
              index: 2,
              icon: AppIcons.navChat,
              selectedIcon: AppIcons.navChatFill,
              label: 'Inbox',
            ),
            _buildNavItem(
              index: 3,
              icon: AppIcons.navProfile,
              selectedIcon: AppIcons.navProfileFill,
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required String icon,
    required String selectedIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Image.asset(
            _selectedIndex == index ? selectedIcon : icon,
            height: 24.h,
          ),
          // Label and divider bar under the label when selected
          if (_selectedIndex == index) ...[
            Text(label,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.yellowColor)),
            Container(
              width: 40.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: AppColors.yellowColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ] else ...[
            const Text(''),
          ],
        ],
      ),
      label: '', // Empty string as label (not necessary with custom Column)
    );
  }
}
