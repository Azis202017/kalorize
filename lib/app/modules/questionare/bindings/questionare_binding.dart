import 'package:get/get.dart';

import '../controllers/questionare_controller.dart';

class QuestionareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionareController>(
      () => QuestionareController(),
    );
  }
}
