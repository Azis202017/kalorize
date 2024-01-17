import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../theme/font.dart';
import '../full_size_button.dart';

class FailedQuestionare extends StatelessWidget {
  const FailedQuestionare({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Yah...',
          style: display,
        ),
        Text('Sepertinya ada kesalahan', style: display),
        const SizedBox(
          height: 28,
        ),
        Image.asset(
          'assets/img/failed_state_questionare.png',
          width: 280,
          height: 280,
        ),
        const SizedBox(
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PrimaryButton(
            title: 'Coba Lagi',
            onPressed: () => Get.offAllNamed(Routes.QUESTIONARE),
          ),
        ),
      ],
    );
  }
}
