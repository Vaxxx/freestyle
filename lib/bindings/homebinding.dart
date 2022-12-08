import 'package:freestyle/controller/boarding_controller.dart';
import 'package:freestyle/controller/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BoardingController());
  }
}
