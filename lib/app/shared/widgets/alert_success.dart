import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const CustomToast({super.key, required this.message, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color(0xFF1AB269), // Replace with your border color
            width: 1.0,
          ),
          color: const Color(0xFFE9FCF3), // Replace with your background color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.black), // Adjust text color as needed
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: onClose,
              color: const Color(0xFF1AB269), // Replace with your icon color
            ),
          ],
        ),
      ),
    );
  }
}
