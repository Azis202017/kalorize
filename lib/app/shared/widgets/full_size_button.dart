
import 'package:flutter/material.dart';

class FullSizeButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const FullSizeButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
