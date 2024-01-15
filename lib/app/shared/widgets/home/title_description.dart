import 'package:flutter/material.dart';

import '../../theme/font.dart';

class TitleDescription extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleDescription({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: labelLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          subtitle,
          style: pharagraph,
        ),
      ],
    );
  }
}
