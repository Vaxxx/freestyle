import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/images/splash.jpg',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/images/splash.jpg',
        title: 'Screen 2',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/images/splash.jpg',
        title: 'Screen 3',
        body: 'Connect with the people from different places',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
          padding: EdgeInsets.only(bottom: 25.0),
          child: Image.asset('assets/images/splash.jpg',
              width: 300.0, height: 300.0),
        ),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        finishCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Finish clicked"),
          ));
        },
      ),
    );
  }
}
