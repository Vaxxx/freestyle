import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/controller/boarding_controller.dart';
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

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  HomeController homeController = HomeController();
  BoardingController boardingController = BoardingController();
  var recordFlag = false;

  late Future<ByteData> imageFile;

  @override
  void initState() {
    super.initState();
    final data = GetStorage();
    homeController = Get.put(HomeController());
    boardingController = Get.put(BoardingController());
    var userId = data.read('userId');

    boardingController.getProfile(userId);
    debugPrint('userId: $userId');
    debugPrint(
        'boarding result status: ${boardingController.recordStatus.value}');
    recordFlag = data.read('rs');
    debugPrint("rcorddddddddddddd1': ${data.read('rs')}");
    debugPrint('recordFlag: $recordFlag');
  }

  int userValue = 0;
  String emailValue = '';

  ///get variable name
  var firstname = '';
  var lastname = '';
  var phone = '';
  var city = '';
  var country = '';
  var bio = '';
  var pictureName = '';
  var bannerName = '';
  var picturez = '';
  var bannerz = '';
  void onTap(int pageIndex) {
    homeController.pageController.value.animateToPage(
        homeController.pageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut);
  }

  onPageChanged(int pageIndex) {
    homeController.pageIndex.value = pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    //get values from sharedPreferences(getx)

    final dataValue = GetStorage(); //initialize getStorage

    if (dataValue.read('userId') != null) {
      userValue = dataValue.read('userId');
      debugPrint("User Id: $userValue");

      emailValue = dataValue.read('email');

      debugPrint("Stored Email: $emailValue");
    }

    debugPrint("I am in Dashboard");
    debugPrint("Record Report: ${boardingController.recordStatus.value} ");

    boardingController.getProfile(userValue);
    debugPrint("rcorddddddddddddd2': ${dataValue.read('rs')}");
    if (recordFlag == true) {
      //means there exists a record
      firstname = dataValue.read('firstname');
      lastname = dataValue.read('lastname');
      phone = dataValue.read('phone');
      // city = dataValue.read('city');
      // country = dataValue.read('country');
      // bio = dataValue.read('bio');
      // pictureName = dataValue.read('pictureName');
      // bannerName = dataValue.read('bannerName');
      // picturez = dataValue.read('picturez');
      // bannerz = dataValue.read('bannerz');
    } else {
      firstname = '';
      lastname = '';
      phone = '';
      city = '';
      country = '';
      bio = '';
      pictureName = '';
      bannerName = '';
      picturez = '';
      bannerz = '';
    }

    debugPrint("firstname: $firstname");
    debugPrint("phone: $phone");
    return Scaffold(
      backgroundColor: Dimensions.blackColor,
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: PageWidget.textWidget(
            textLabel: "Dashboard",
            fontFamily: 'OpenSans',
            fontSize: Dimensions.height30,
            fontWeight: FontWeight.w800,
            textColor: Dimensions.lightGreyColor),
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
                  // PageWidget.textWidget(
                  //     textLabel: "DASHBOARD",
                  //     fontFamily: 'OpenSans',
                  //     fontSize: Dimensions.height20,
                  //     fontWeight: FontWeight.w600,
                  //     textColor: Dimensions.lightGreyColor),
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
                  radius: Dimensions.height100,
                  animation: true,
                  animationDuration: 2000,
                  lineWidth: Dimensions.width15,
                  percent: 0.9,
                  reverse: true,
                  arcBackgroundColor: recordFlag == true
                      ? Dimensions.greenOpacityColor
                      : Dimensions.redColor,
                  arcType: ArcType.FULL,
                  center: recordFlag == true
                      ? PageWidget.textWidget(
                          textLabel: "Sign Up is Complete",
                          fontFamily: 'OpenSans',
                          fontSize: Dimensions.height15,
                          fontWeight: FontWeight.w700,
                          textColor: Dimensions.greenOpacityColor)
                      : PageWidget.textWidget(
                          textLabel: "Sign Up Not Complete",
                          fontFamily: 'OpenSans',
                          fontSize: Dimensions.height15,
                          fontWeight: FontWeight.w700,
                          textColor: Dimensions.redColor),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Dimensions.blackColor,
                  progressColor: Dimensions.greenOpacityColor,
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
