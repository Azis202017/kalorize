import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingBottom;
  final double? paddingLeft;
  final TextStyle? textStyle;

  final void Function()? onPressed;
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width = double.infinity,
    this.height = 40,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.paddingLeft,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
            top: paddingTop ?? 4,
            bottom: paddingBottom ?? 4,
            right: paddingRight ?? 20,
            left: paddingLeft ?? 20,
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style:textStyle),
      ),
    );
  }
}
