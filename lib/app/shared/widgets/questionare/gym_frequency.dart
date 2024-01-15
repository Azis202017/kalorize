
import 'package:flutter/material.dart';
import 'package:kalorize/app/shared/theme/color.dart';

class GymFrequensy extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onPressed;
  final String title;

  const GymFrequensy({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onPressed,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? neutralPrimary : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
            side: const BorderSide(color: neutralPrimary),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
