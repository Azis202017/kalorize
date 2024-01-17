import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../theme/font.dart';
import '../full_size_button.dart';

class SuccessQuestionare extends StatelessWidget {
  const SuccessQuestionare({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Keren!!',
          style: display,
        ),
        Text('Kamu sudah siap.', style: display),
        const SizedBox(
          height: 28,
        ),
        Image.asset(
          'assets/img/success_state_questionare.png',
          width: 280,
          height: 280,
        ),
        const SizedBox(
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PrimaryButton(
            title: 'Mulai',
            onPressed: () => Get.offAllNamed(Routes.HOME),
          ),
        ),
      ],
    );
  }
}
