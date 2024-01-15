
import 'package:flutter/material.dart';

import '../theme/color.dart';

class GenderButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final Radius topLeftRadius;
  final Radius topRightRadius;
  final Radius bottomRightRadius;
  final Radius bottomLeftRadius;

  const GenderButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.topLeftRadius = const Radius.circular(0),
    this.bottomLeftRadius = const Radius.circular(0),
    this.bottomRightRadius = const Radius.circular(0),
    this.topRightRadius = const Radius.circular(0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: isSelected ? Colors.white : Colors.white,
            backgroundColor: isSelected ? neutralPrimary : Colors.white,
            side: const BorderSide(
              color: neutralPrimary,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: bottomLeftRadius,
                bottomRight: bottomRightRadius,
                topLeft: topLeftRadius,
                topRight: topRightRadius,
              ),
            )),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
