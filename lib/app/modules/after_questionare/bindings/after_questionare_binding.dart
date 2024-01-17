import 'package:get/get.dart';

import '../controllers/after_questionare_controller.dart';

class AfterQuestionareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AfterQuestionareController>(
      () => AfterQuestionareController(),
    );
  }
}
