import 'package:flutter/material.dart';
import 'package:kalorize/app/shared/theme/color.dart';
import 'package:kalorize/app/shared/theme/font.dart';

class RichSecondText extends StatelessWidget {
  final String text1;
  final String? text2;
  final void Function()? onTap;
  const RichSecondText({
    super.key,
    required this.text1,
    this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text.rich(
          TextSpan(
            text: text1,
            style: pharagraph,
            children: [
              TextSpan(
                text: text2,
                style: labelSmall.copyWith(
                  color: neutralPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
