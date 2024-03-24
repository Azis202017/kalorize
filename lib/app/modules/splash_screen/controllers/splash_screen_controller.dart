import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
 

  Future<void> checkOnboardingStatus() async {
    final box = GetStorage();

    bool onboardingCompleted = box.read('onboarding_completed') ?? false;
    print(onboardingCompleted);
    if (onboardingCompleted) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
