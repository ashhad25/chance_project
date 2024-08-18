// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_ui/components/bottomNavigationbar.dart';
import 'package:test_ui/utils/constants.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> with TickerProviderStateMixin {
  String topicText = '';
  int selectedTopicIndex = 0;

  void _showBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) {
        return Container(
          height: 350,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/divider.png',
                    width: 72,
                    height: 4,
                  ),
                ),
              ),
              _buildListItem(0, 'Topic 1'),
              _buildListItem(1, 'Topic 2'),
              _buildListItem(2, 'Topic 3'),
              _buildListItem(3, 'Topic 4'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem(int index, String text) {
    bool isSelected = selectedTopicIndex == index;
    return ListTile(
      leading: ImageIcon(
        AssetImage('assets/images/topic_icon.png'),
        color: isSelected
            ? AppColors.secondarytextColor
            : AppColors.primarytextColor,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: isSelected
              ? AppColors.secondarytextColor
              : AppColors.primarytextColor,
        ),
      ),
      tileColor: isSelected ? AppColors.primaryColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {
        setState(() {
          selectedTopicIndex = index;
          topicText = text;
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondarytextColor,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/image.png',
              scale: 2,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.verified,
              color: AppColors.primaryColor,
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColors.primarytextColor,
            ),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.primarytextColor,
            indicatorColor: AppColors.primaryColor,
            controller: TabController(length: 2, vsync: this),
            tabs: const [
              Tab(
                child: Text(
                  'Public Feed',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                ),
              ),
              Tab(
                child: Text(
                  'Business Feed',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                ),
              ),
            ]),
      ),
      body: TabBarView(
        controller: TabController(length: 1, vsync: this),
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        topicText == '' ? 'Feeds' : topicText,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                          onPressed: _showBottomSheet,
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                card(
                    'assets/images/person_image.jpeg',
                    'James',
                    'Topic name',
                    'Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.',
                    ''),
                card(
                    'assets/images/person_image.jpeg',
                    'James',
                    'Topic name',
                    'Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.',
                    'assets/images/person_image.jpeg'),
                card(
                    'assets/images/person_image2.jpeg',
                    'Bruno Pham',
                    'Topic name',
                    'Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.',
                    'assets/images/person_image2.jpeg'),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(),
    );
  }
}

Widget card(
  String imageIcon,
  String name,
  String topicName,
  String description,
  String image,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      height: image == '' ? 170 : 390,
      width: 343,
      child: Card(
        color: AppColors.cardBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(imageIcon),
              ),
              title: Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.verified,
                    size: 12,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '. 1 hour ago',
                    style: GoogleFonts.manrope(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              subtitle: Text(
                topicName,
                style: GoogleFonts.manrope(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              trailing: IconButton(
                  padding: EdgeInsets.only(left: 40),
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: AppColors.primarytextColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                    fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            image == ''
                ? Container()
                : Image(
                    image: AssetImage(image),
                    height: 224,
                    width: 343,
                    fit: BoxFit.fitWidth,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/favourite_icon.png',
                          height: 25,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/comment_icon.png',
                          height: 25,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/send_icon.png',
                          height: 25,
                        )),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_outline,
                      size: 25,
                    ))
              ],
            )
          ],
        ),
      ),
    ),
  );
}
