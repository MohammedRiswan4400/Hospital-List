import 'package:flutter/material.dart';
import 'package:my_hospital/view/screen_splash/widgets/splash_widgets.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoScreenHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SplashScreenBottomWidget(),
          SplashScreenTopWidget(),
        ],
      ),
    );
  }
}
