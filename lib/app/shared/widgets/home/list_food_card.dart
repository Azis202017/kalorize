import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/data/model/recommendation_food.dart';
import 'package:kalorize/app/shared/widgets/home/food_card.dart';

import '../../../routes/app_pages.dart';

class ListOfFoodBreakfastCard extends StatelessWidget {
  final RecommendationFood? food;
  final int length;
  final void Function(Breakfast)? onPressed;
  const ListOfFoodBreakfastCard({
    super.key,
    this.food,
    this.length = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
          itemCount: length,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(
            right: 12,
          ),
          itemBuilder: (_, index) {
            var data = food?.breakfast?[index];
            return GestureDetector(
              onTap: () => Get.toNamed(
                Routes.DETAIL_FOOD,
                arguments: {
                  'food': data,
                },
              ),
              child: FoodCard(
                name: data?.nama ?? "",
                calori: data?.kalori ?? 0,
                protein: data?.protein ?? 0,
                onPressed: () => onPressed?.call(data!),
                image: data?.foto ?? "",
                itemId: data?.id ?? 0,
                mealType: "breakfast",
              ),
            );
          }),
    );
  }
}
