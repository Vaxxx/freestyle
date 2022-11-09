import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {
  var activeStepIndex = 0.obs;
  var countryValue = ''.obs;
  var stateValue = ''.obs;
  var cityValue = ''.obs;
  var stepperButtonText = ''.obs;
  Rx<PlatformFile> profilePictureFile =
      PlatformFile(name: 'platform', size: 1500).obs;
  Rx<PlatformFile> profileBannerFile =
      PlatformFile(name: 'platform', size: 1500).obs;
  // PlatformFile profileBannerFile = null.obs as PlatformFile;

  void increaseSteps() {
    activeStepIndex += 1;
  }

  void decreaseSteps() {
    activeStepIndex -= 1;
  }
}
