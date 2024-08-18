import 'package:flutter/material.dart';
import 'package:test_ui/views/camera_screen.dart';
import 'package:test_ui/views/chat.dart';
import 'package:test_ui/views/chatpreview.dart';
import 'package:test_ui/views/createpost.dart';
import 'package:test_ui/views/mainfeed.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.mainfeed:
        return MaterialPageRoute(builder: (context) => MainFeed());

      case RouteName.createpost:
        return MaterialPageRoute(
            builder: (context) => CreatePost(
                  data: settings.arguments as Map,
                ));

      case RouteName.chat:
        return MaterialPageRoute(builder: (context) => Chat());

      case RouteName.chatpreview:
        return MaterialPageRoute(builder: (context) => ChatPreview());

      case RouteName.cameraScreen:
        return MaterialPageRoute(builder: (context) => CameraScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No Route Defined'),
                  ),
                ));
    }
  }
}

class RouteName {
  static const mainfeed = 'home_screen';
  static const createpost = 'screen_two';
  static const chat = 'screen_three';
  static const chatpreview = 'screen_four';
  static const cameraScreen = 'screen_five';
}
