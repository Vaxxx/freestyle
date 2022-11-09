import 'package:flutter/material.dart';
import 'package:freestyle/bindings/homebinding.dart';
import 'package:freestyle/pages/login.dart';
import 'package:freestyle/pages/notifications.dart';
import 'package:freestyle/pages/register.dart';
import 'package:freestyle/pages/settings.dart';
import 'package:freestyle/pages/user/activities.dart';
import 'package:freestyle/pages/user/dashboard.dart';
import 'package:freestyle/pages/user/messages.dart';
import 'package:freestyle/pages/user/onboarding.dart';
import 'package:freestyle/pages/user/profile.dart';
import 'package:freestyle/pages/user/stage.dart';
import 'package:get/get.dart';

import 'bindings/boarding_binding.dart';
import 'bindings/user_binding.dart';

void main() {
  runApp(GetMaterialApp(
    initialBinding: UserBindings(),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => Login()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/register', page: () => const Register()),
      GetPage(
          name: '/dashboard', page: () => Dashboard(), binding: HomeBindings()),
      GetPage(name: '/profile', page: () => Profile()),
      GetPage(
          name: '/onBoarding',
          page: () => OnBoarding(),
          binding: BoardingBindings()),
      GetPage(name: '/settings', page: () => const Settings()),
      GetPage(name: '/activities', page: () => const Activities()),
      GetPage(name: '/messages', page: () => const Messages()),
      GetPage(name: '/stage', page: () => const Stage()),
      GetPage(name: '/notifications', page: () => const Notifications()),
    ],
  ));
}
