import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_ui/routes/routes.dart';
import 'package:test_ui/views/camera_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false, fontFamily: GoogleFonts.nunito().fontFamily),
      initialRoute: RouteName.mainfeed,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
