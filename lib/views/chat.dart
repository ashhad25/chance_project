// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_ui/components/bottomNavigationbar.dart';
import 'package:test_ui/routes/routes.dart';
import 'package:test_ui/utils/constants.dart';
import 'package:test_ui/views/mainfeed.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            chatCard(
              imageIcon: 'assets/images/person_image2.jpeg',
            ),
            chatCard(
              imageIcon: 'assets/images/person_image3.jpeg',
            ),
            chatCard(
              imageIcon: 'assets/images/person_image4.jpeg',
            ),
            chatCard(
              imageIcon: 'assets/images/person_image2.jpeg',
            ),
            chatCard(
              imageIcon: 'assets/images/person_image3.jpeg',
            ),
            chatCard(
              imageIcon: 'assets/images/person_image4.jpeg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        selectedIndex: 3,
      ),
    );
  }
}

class chatCard extends StatelessWidget {
  String imageIcon;
  chatCard({super.key, required this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteName.chatpreview);
        },
        child: Container(
          height: 120,
          width: 335,
          child: Card(
            color: AppColors.cardBackgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(imageIcon),
                  ),
                  title: Text(
                    'Bruono Pham',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Hello, I really like your post about...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.manrope(
                        color: AppColors.secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 72),
                      child: Text(
                        '2 mins ago',
                        style: GoogleFonts.manrope(
                            color: AppColors.secondaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Text('5'),
                          SizedBox(
                            width: 5,
                          ),
                          ImageIcon((AssetImage('assets/images/chats.png')))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  const customAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Message',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
