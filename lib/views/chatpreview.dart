import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_ui/routes/routes.dart';
import 'package:test_ui/utils/constants.dart';

class ChatPreview extends StatefulWidget {
  const ChatPreview({super.key});

  @override
  State<ChatPreview> createState() => _ChatPreviewState();
}

class _ChatPreviewState extends State<ChatPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  chatCard(
                    image: 'assets/images/chat_image.png',
                    description: '',
                    imageIcon: 'assets/images/person_image.jpeg',
                    alignment: Alignment.bottomLeft,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Today',
                        style: TextStyle(color: AppColors.secondarytextColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  chatCard(
                    image: '',
                    description:
                        'Lorem ipsum dolor sit amet consectetur. Nisl id mattis hac quisque sed. Nec massa dui malesuada et urna. Vel ultricies ipsum nec nibh quam habitant eget massa dui. In eu ac curabitur mattis. Neque diam.',
                    imageIcon: 'assets/images/person_image2.jpeg',
                    alignment: Alignment.bottomRight,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  chatCard(
                    image: 'assets/images/chat_image.png',
                    description:
                        'Lorem ipsum dolor sit amet consectetur. Nisl id mattis hac quisque sed. Nec massa dui malesuada et urna. Vel ultricies ipsum nec nibh quam habitant eget massa dui. In eu ac curabitur mattis. Neque diam.',
                    imageIcon: 'assets/images/person_image3.jpeg',
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  chatCard(
                    image: '',
                    description:
                        'Lorem ipsum dolor sit amet consectetur. Nisl id mattis hac quisque sed. Nec massa dui malesuada et urna. Vel ultricies ipsum nec nibh quam habitant eget massa dui. In eu ac curabitur mattis. Neque diam.',
                    imageIcon: 'assets/images/person_image4.jpeg',
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.photo_outlined)),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Type something', border: InputBorder.none),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class chatCard extends StatelessWidget {
  final String image;
  final String imageIcon;
  final String description;
  final AlignmentGeometry alignment;

  chatCard({
    super.key,
    required this.image,
    required this.description,
    required this.imageIcon,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the alignment of the card and adjust padding accordingly
    bool isLeftAligned = alignment == Alignment.bottomLeft;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isLeftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          // Show avatar on the left if left-aligned, otherwise don't show it
          if (isLeftAligned)
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageIcon),
            ),
          SizedBox(
              width: isLeftAligned ? 10 : 0), // Add spacing if left-aligned
          Container(
            width: 250,
            child: Card(
              color: AppColors.cardBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  image != ''
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            image,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            description,
                          ),
                        ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '16:04',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              width: isLeftAligned ? 0 : 10), // Add spacing if right-aligned
          // Show avatar on the right if right-aligned
          if (!isLeftAligned)
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageIcon),
            ),
        ],
      ),
    );
  }
}

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  const customAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          Text(
            'Bruno Pham',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
