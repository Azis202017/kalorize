import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/full_size_button.dart';
import 'package:kalorize/app/shared/widgets/questionare/failed_questionare.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/font.dart';
import '../../../shared/widgets/questionare/success_questionare.dart';
import '../controllers/after_questionare_controller.dart';

class AfterQuestionareView extends GetView<AfterQuestionareController> {
  const AfterQuestionareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: controller.isSuccess ? const Center(child: SuccessQuestionare()) : const Center(child: FailedQuestionare()),
    );
  }
}
