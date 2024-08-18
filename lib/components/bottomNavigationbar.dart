import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_ui/routes/routes.dart';
import 'package:test_ui/utils/constants.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavItem(
              0,
              selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
              'Home',
              () {}),
          buildNavItem(1, Icons.search_outlined, 'Search', () {}),
          buildNavItem(2, Icons.add_box_outlined, 'Create', () {
            // Navigator.pushNamed(context, RouteName.createpost);
            // print('hello');
          }),
          buildNavItemWithImage(
              3, 'assets/images/chats_icon.png', 'Chat', () {}),
          buildNavItem(4, Icons.person_2_outlined, 'Profile', () {}),
        ],
      ),
    );
  }

  Widget buildNavItem(
      int index, IconData icon, String label, Function onPressed) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        if (index == 2) {
          Navigator.pushNamed(context, RouteName.createpost);
        } else if (index == 3) {
          Navigator.pushNamed(context, RouteName.chat);
        }
      },
      child: Container(
        height: 70,
        width: 60,
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.primarytextColor,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primarytextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItemWithImage(
      int index, String imagePath, String label, Function onPressed) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 70,
        width: 60,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 30,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.primarytextColor,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primarytextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
