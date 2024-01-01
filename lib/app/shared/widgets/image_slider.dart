import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final PageController controller;
  final int itemCount;
  final void Function(int)? onPageChanged;
  final List<String> imageList;
  const ImageSlider({
    super.key,
    required this.controller,
    required this.imageList,
    required this.itemCount,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: itemCount,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: Image.asset(
            imageList[index],
            fit: BoxFit.fitWidth,
          ),
        );
      },
    );
  }
}
