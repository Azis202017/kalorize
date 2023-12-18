import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CenterLogo extends StatelessWidget {
  final String logo;
  const CenterLogo({
    super.key,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/svg/$logo.svg',
      ),
    );
  }
}
