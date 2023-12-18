
import 'package:flutter/material.dart';

import '../theme/font.dart';

class Welcome extends StatelessWidget {
  final String title;
  final String? subtitle;
  const Welcome({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: h2Bold),
        Text(
          "$subtitle",
          style:body2Regular
        ),
      ],
    );
  }
}
