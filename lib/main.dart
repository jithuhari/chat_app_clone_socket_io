import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatts_app/screens/camera_layout/camera_layout_screen.dart';
import 'package:whatts_app/screens/login_screen/login_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: const Color(0xFF075E54),
          secondaryHeaderColor: const Color(0xFF075E54)),
      home: const LoginScreen(),
    );
  }
}
