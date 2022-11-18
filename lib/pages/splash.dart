import 'package:flutter/material.dart';
import 'package:freestyle/pages/user/home_page.dart';

import '../utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('......................................................');
    // print("height ${Get.context!.height}");
    // print("width ${Get.context!.width}");
    // print("width ${ MediaQuery.of(context).size.height}");
    // print("height: ${Dimensions.SCREEN_HEIGHT}");
    // print("width: ${Dimensions.SCREEN_WIDTH}");
    // print("height60: ${Dimensions.height60}");
    return Scaffold(
      backgroundColor: Dimensions.blackColor,
      body: AnimatedContainer(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/splash.jpg"))),
        curve: Curves.bounceInOut,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
