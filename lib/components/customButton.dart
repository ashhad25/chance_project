import 'package:flutter/material.dart';
import 'package:test_ui/utils/constants.dart';

class CustomButton extends StatelessWidget {
  int index, selectedIndex;
  String text;
  VoidCallback onTap;
  double width, height;
  CustomButton(
      {super.key,
      required this.index,
      required this.selectedIndex,
      required this.width,
      required this.height,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.transparent,
            border: Border.all(
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.secondarytextColor
                  : AppColors.primarytextColor,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
