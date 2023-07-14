import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/colors/colors.dart';
import '../../screen_home/screen_home.dart';

class SplashScreenBottomWidget extends StatelessWidget {
  const SplashScreenBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        "assets/splash2.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

class SplashScreenTopWidget extends StatelessWidget {
  const SplashScreenTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: kSplashGradient,
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // padding: const EdgeInsets.only(left: 50),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 200),
              child: Lottie.network(
                  "https://lottie.host/f1166e8e-173e-4765-a0eb-32b2c7dbb30d/MLbrfZIDuN.json"),
            ),
          ),
          const Center(
            child: Text(
              "My Hospitals",
              style: TextStyle(
                color: kWhite,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: kGradientBlack,
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "The evolution of hospitals in the Western world from charitable guesthouses to centers of scientific excellence has been influenced by a number of social and cultural developments.",
                  style: TextStyle(
                    color: kWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future gotoScreenHome(context) async {
  await Future.delayed(const Duration(seconds: 6));
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return const ScreenHome();
    },
  ));
}
