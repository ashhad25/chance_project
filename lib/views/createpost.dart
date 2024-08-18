import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_ui/components/customAppBar.dart';
import 'package:test_ui/components/customButton.dart';
import 'package:test_ui/routes/routes.dart';
import 'package:test_ui/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  dynamic data;
  CreatePost({super.key, required this.data});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool? isSelected;
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data['imagePath']);
  }

  void dispose() {
    // Delete the image file when disposing
    if (widget.data['imagePath'] != null) {
      final file = File(widget.data['imagePath']);
      if (file.existsSync()) {
        file.deleteSync();
      }
    }
    super.dispose();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => widget.data['imagePath'] = imageTemp.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(widget.data),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                minLines: null,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something',
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            'Topic',
                            style: TextStyle(fontSize: 20),
                          ))),
                  Container(
                    height: 40,
                    width: 500,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        CustomButton(
                          index: 0,
                          selectedIndex: selectedIndex,
                          text: 'Climate Change & Sustainability',
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 0,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomButton(
                          index: 1,
                          selectedIndex: selectedIndex,
                          text: 'Sustainability',
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          width: MediaQuery.of(context).size.width / 3,
                          height: 0,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomButton(
                          index: 2,
                          selectedIndex: selectedIndex,
                          text: 'Climate Change & Sustainability',
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          width: 250,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                  widget.data['imagePath'] == ''
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteName.cameraScreen);
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 44,
                                    color: AppColors.secondaryColor,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: pickImage,
                                  icon: Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 40,
                                    color: AppColors.secondaryColor,
                                  ))
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20, right: 150),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:
                                      FileImage(File(widget.data['imagePath'])),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.primarytextColor,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.data['imagePath'] = '';
                                      });
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: AppColors.secondarytextColor,
                                    )),
                              ),
                            )
                          ]),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
