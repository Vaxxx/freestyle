import 'package:get/instance_manager.dart';

import '../controller/boarding_controller.dart';

class BoardingBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BoardingController());
  }

}