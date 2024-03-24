import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/home/controllers/home_controller.dart';
import '../../theme/color.dart';
import '../../theme/font.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final num calori;
  final num protein;
  final String image;
  final int itemId;
  final String mealType;
  final void Function()? onPressed;
  const FoodCard({
    super.key,
    this.name = "",
    this.calori = 0,
    this.protein = 0,
    this.image = "",
    this.onPressed,
    required this.itemId,
    required this.mealType,
  });

  @override
  Widget build(BuildContext context) {
    final int? selectedItemId =
        Get.find<HomeController>().selectedItems[mealType];
    final bool isSelected = (itemId == selectedItemId);
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
                ? Image.network(
                    image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 140,
                  )
                : Image.asset(
                    'assets/img/empty_image.jpg',
                    width: double.infinity,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
            ),
            child: Center(
              child: Text(
                '$name ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: labelSmall,
                textAlign: TextAlign.center,
              ),
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
                    Text('$protein gr', style: caption),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: double.infinity,
                    // Bagian widget ElevatedButton di dalam widget FoodCard
                    child: ElevatedButton(
                      onPressed: () {
                        onPressed?.call();

                        final HomeController controller =
                            Get.find<HomeController>();

                        if (isSelected) {
                          // Jika sudah dipilih, batalkan pemilihan
                          controller.cancelSelection(mealType);
                        } else {
                          // Jika belum dipilih, pilih item
                          controller.selectItem(mealType, itemId);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? const Color(0xFF4D555C) // Warna saat item dipilih
                            : const Color(
                                0xFFF94917), // Warna saat item belum dipilih
                      ),
                      child: Text(
                        isSelected ? 'Cancel' : 'Pilih',
                        style: TextStyle(
                          // Ganti warna teks sesuai kondisi isSelected
                          color: isSelected ? Colors.white : Colors.white,
                        ),
                      ),
                    )),
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
