import 'package:flutter/material.dart';
import 'view/screen_splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My Hospital",
      home: ScreenSplash(),
    );
  }
}
