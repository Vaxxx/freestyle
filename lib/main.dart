import 'package:flutter/material.dart';
import 'package:freestyle/bindings/homebinding.dart';
import 'package:freestyle/pages/login.dart';
import 'package:freestyle/pages/notifications.dart';
import 'package:freestyle/pages/register.dart';
import 'package:freestyle/pages/settings.dart';
import 'package:freestyle/pages/splash.dart';
import 'package:freestyle/pages/user/activities.dart';
import 'package:freestyle/pages/user/dashboard.dart';
import 'package:freestyle/pages/user/home_page.dart';
import 'package:freestyle/pages/user/messages.dart';
import 'package:freestyle/pages/user/onboarding.dart';
import 'package:freestyle/pages/user/profile.dart';
import 'package:freestyle/pages/user/stage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/boarding_binding.dart';
import 'bindings/user_binding.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    initialBinding: UserBindings(),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/register', page: () => Register()),
      GetPage(name: '/homePage', page: () => const HomePage()),
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
