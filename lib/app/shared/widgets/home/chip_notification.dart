
import 'package:flutter/material.dart';



class ChipNotification extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  const ChipNotification({
    super.key,
    required this.text,
    required this.icon,
    this.color = const Color(0xFFFF4644),
    this.backgroundColor = const Color(
      0xFFFFECEC,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor, // Background color #FFECEC
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(color: color // Border color #FF4644
            ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color, // Text color #FF4644
            ),
          ),
          Icon(
            icon,
            size: 12.0,
            color: color, // Icon color #FF4644
          ),
        ],
      ),
    );
  }
}
