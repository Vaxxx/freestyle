import 'package:flutter/material.dart';
import 'package:freestyle/utils/dimensions.dart';
import 'package:freestyle/utils/widgets.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Dimensions.greyColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Dimensions.greyColor),
            child: Padding(
                padding: EdgeInsets.all(Dimensions.height20),
                child: PageWidget.textWidget(
                    textLabel: "Freestyle League",
                    fontFamily: 'Tangerine',
                    fontSize: Dimensions.height50,
                    fontWeight: FontWeight.w900,
                    textColor: Dimensions.blackColor)),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: PageWidget.textWidget(
                textLabel: "Dashboard",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {
              Get.toNamed("/dashboard");
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: PageWidget.textWidget(
                textLabel: "Profile",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {
              Get.toNamed("/profile");
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration_outlined),
            title: PageWidget.textWidget(
                textLabel: "On Boarding",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {
              Get.toNamed("/onBoarding");
            },
          ),
          ListTile(
            leading: const Icon(Icons.horizontal_distribute_sharp),
            title: PageWidget.textWidget(
                textLabel: "Activity",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {
              Get.toNamed("/Activities");
            },
          ),
          ListTile(
            leading: const Icon(Icons.message_sharp),
            title: PageWidget.textWidget(
                textLabel: "Messages",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {
              Get.toNamed("/Messages");
            },
          ),
          ListTile(
            leading: const Icon(Icons.cabin_outlined),
            title: PageWidget.textWidget(
                textLabel: "Stage",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {
              Get.toNamed("/Stage");
            },
          ),
          const Divider(color: Dimensions.lightGreyColor),
          ListTile(
            leading: const Icon(Icons.search),
            title: PageWidget.textWidget(
                textLabel: "Search",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: PageWidget.textWidget(
                textLabel: "Settings",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notification_add_rounded),
            title: PageWidget.textWidget(
                textLabel: "Notifications",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: PageWidget.textWidget(
                textLabel: "Exit",
                fontFamily: 'OpenSans',
                fontSize: Dimensions.height20,
                fontWeight: FontWeight.w700,
                textColor: Dimensions.blackColor),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
