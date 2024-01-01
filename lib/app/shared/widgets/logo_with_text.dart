import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/json/logo_mark.json',
          width:150,
        ),
        Lottie.asset(
          'assets/json/logo_type.json',
        ),
      ],
    );
  }
}
