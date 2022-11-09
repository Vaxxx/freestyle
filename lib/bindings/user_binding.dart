import 'package:get/instance_manager.dart';

import '../controller/user_controller.dart';

class UserBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }

}