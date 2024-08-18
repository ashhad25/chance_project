import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_ui/routes/routes.dart';
import 'package:test_ui/utils/constants.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  int selectedIndex;
  BottomNavigationBarCustom({super.key, required this.selectedIndex});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavItem(
              0,
              widget.selectedIndex == 0
                  ? Icons.home_filled
                  : Icons.home_outlined,
              'Home', () {
            setState(() {
              widget.selectedIndex = 0;
            });
            Navigator.pushNamed(context, RouteName.mainfeed);
          }),
          buildNavItem(1, Icons.search_outlined, 'Search', () {
            setState(() {
              widget.selectedIndex = 1;
            });
          }),
          buildNavItem(2, Icons.add_box_outlined, 'Create', () {
            setState(() {
              widget.selectedIndex = 2;
            });
            Navigator.pushNamed(context, RouteName.createpost, arguments: {
              'resetIndex': () {
                setState(() {
                  widget.selectedIndex = 0;
                });
              },
              'imagePath': ''
            });
          }),
          buildNavItemWithImage(
              3,
              widget.selectedIndex == 3
                  ? 'assets/images/chats_icon_selected.png'
                  : 'assets/images/chats_icon.png',
              'Chat', () {
            setState(() {
              widget.selectedIndex = 3;
            });
            Navigator.pushNamed(context, RouteName.chat);
          }),
          buildNavItem(4, Icons.person_2_outlined, 'Profile', () {
            setState(() {
              widget.selectedIndex = 4;
            });
          }),
        ],
      ),
    );
  }

  Widget buildNavItem(
      int index, IconData icon, String label, VoidCallback onPressed) {
    bool isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: onPressed,
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
      int index, String imagePath, String label, VoidCallback onPressed) {
    bool isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: onPressed,
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
