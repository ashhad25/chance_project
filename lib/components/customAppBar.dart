import 'package:flutter/material.dart';
import 'package:test_ui/components/customButton.dart';
import 'package:test_ui/routes/routes.dart';
import 'package:test_ui/utils/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  dynamic data;
  CustomAppBar(this.data, {super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool? isSelected;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {
                  print(widget.data);
                  setState(() {
                    selectedIndex = 0;
                    Navigator.pushNamed(context, RouteName.mainfeed);
                  });
                },
                icon: Icon(Icons.arrow_back)),
            Text(
              'Create Post',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 74,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    widget.data['resetIndex']();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Post',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(0),
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primaryColor)),
                ),
              ),
            )
          ]),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                index: 0,
                selectedIndex: selectedIndex,
                text: 'Public',
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                width: 170,
                height: 40,
              ),
              CustomButton(
                index: 1,
                selectedIndex: selectedIndex,
                text: 'Business',
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                width: 170,
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
