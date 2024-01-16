import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/home/controllers/home_controller.dart';
import '../../theme/color.dart';
import '../../theme/font.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final int calori;
  final int protein;
  final String image;
  final int itemId;
  final void Function()? onPressed;
  const FoodCard({
    super.key,
    this.name = "",
    this.calori = 0,
    this.protein = 0,
    this.image = "",
    this.onPressed,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        (Get.find<HomeController>().isSelected[itemId] ?? false);

    return Container(
      width: 148,
      margin: const EdgeInsets.only(
        right: 12,
      ),
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(0, 6),
            blurRadius: 14,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 56),
            blurRadius: 34,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.01),
            offset: Offset(0, 100),
            blurRadius: 40,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.00),
            offset: Offset(0, 157),
            blurRadius: 44,
            spreadRadius: 0,
          ),
        ],
        color: neutralLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                20,
              ),
              topRight: Radius.circular(
                20,
              ),
            ),
            child: image.isNotEmpty
                ? Image.asset(
                    'assets/img/$image',
                  )
                : Image.asset(
                    'assets/img/empty_image.jpg',
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: Text(
              '$name ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: labelSmall,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$calori kcal',
                      style: caption.copyWith(
                        color: mainPrimary,
                      ),
                    ),
                    Text('$calori gr', style: caption),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      onPressed?.call();
                      Get.find<HomeController>().toggleSelection(itemId);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? const Color(0xFF4D555C) : const Color(0xFFF94917),
                    ),
                    child: Text(
                      isSelected ? 'Cancel' : 'Pilih',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
