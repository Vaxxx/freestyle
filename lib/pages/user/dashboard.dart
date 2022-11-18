import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/controller/home_controller.dart';
import 'package:freestyle/pages/user/home_page.dart';
import 'package:freestyle/pages/user/messages.dart';
import 'package:freestyle/utils/dimensions.dart';
import 'package:freestyle/utils/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../utils/nav_drawer.dart';
import '../settings.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final HomeController c = Get.put(HomeController());

  void onTap(int pageIndex) {
    c.pageController.value.animateToPage(c.pageIndex.value,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

  onPageChanged(int pageIndex) {
    c.pageIndex.value = pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    //get values from sharedPreferences(getx)

    final dataValue = GetStorage(); //initialize getStorage

    //read values
    if (dataValue.read('email') != null) {
      var _storedEmail = dataValue.read('email');
      debugPrint("Storewd Email: $_storedEmail");
    }

    return Scaffold(
      backgroundColor: Dimensions.blackColor,
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: PageWidget.textWidget(
            textLabel: "Freestyle League",
            fontFamily: 'OpenSans',
            fontSize: Dimensions.height30,
            fontWeight: FontWeight.w800,
            textColor: Dimensions.whiteColor),
        backgroundColor: Dimensions.blackColor,
        // actions: [
        //   Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: const [
        //       Icon(
        //         Icons.person,
        //         color: Dimensions.whiteColor,
        //       )
        //     ],
        //   )
        // ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      color: Dimensions.whiteColor,
                      onPressed: () =>
                          Future.delayed(const Duration(seconds: 1)).then((_) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const Messages(),
                            ));
                          }),
                      icon: const Icon(Icons.message)),
                  PageWidget.textWidget(
                      textLabel: "DASHBOARD",
                      fontFamily: 'OpenSans',
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w600,
                      textColor: Dimensions.whiteColor),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: CircleAvatar(
                      radius: Dimensions.height20,
                      backgroundImage: const AssetImage(
                          'assets/images/imagePlaceholder.png'),
                      backgroundColor: Dimensions.whiteColor,
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height60,
                    horizontal: Dimensions.SCREEN_WIDTH - Dimensions.width20),
                decoration: BoxDecoration(
                  color: Dimensions.greyColor,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimensions.height20),
                child: CircularPercentIndicator(
                  radius: Dimensions.height150,
                  animation: true,
                  animationDuration: 2000,
                  lineWidth: Dimensions.width15,
                  percent: 0.9,
                  reverse: true,
                  arcBackgroundColor: Dimensions.deepGreyColor,
                  arcType: ArcType.FULL,
                  center: PageWidget.textWidget(
                      textLabel: "Sign Up Not Complete",
                      fontFamily: 'OpenSans',
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w700,
                      textColor: Dimensions.whiteColor),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Dimensions.blackColor,
                  progressColor: Dimensions.whiteColor,
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: 1,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
            icon: const Icon(Icons.home),
            color: Dimensions.blackColor,
            onPressed: () {
              Get.to(const HomePage());
            },
          )),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => const Settings(),
                icon: const Icon(Icons.settings)),
          ),
        ],
      ),
    );
  }
}
