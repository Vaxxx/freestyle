import 'package:flutter/material.dart';

import 'login.dart';

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
        builder: (context) => const Login(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: AnimatedContainer(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash.jpg"))),
          curve: Curves.bounceInOut,
          duration: const Duration(seconds: 5),
        ),
      ),
    );
  }
}
