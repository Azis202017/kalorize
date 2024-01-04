import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/logo.svg',
          width: 150,
        )
            .animate()
            .moveY(
              duration: 700.ms,
            )
            .shake(
              duration: 700.ms,
            ),
        const SizedBox(
          height: 20,
        ),
        SvgPicture.asset(
          'assets/svg/KALORIZE.svg',
          width: 150,
        ).animate().move(
              duration: 700.ms,
            ),
      ],
    );
  }
}
