import 'package:flutter/material.dart';
import 'package:freestyle/pages/register.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () async {
            var data = await Get.to(() => const Register(),
                transition: Transition.circularReveal,
                duration: const Duration(seconds: 3),
                curve: Curves.easeInOutCubicEmphasized,
                arguments: 'Click Here to Sign up');
            debugPrint(data);
          },
          child: const Text('Click Here to Sign up')),
    );
  }
}
