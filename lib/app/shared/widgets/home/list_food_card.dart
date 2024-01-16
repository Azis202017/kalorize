import 'package:flutter/widgets.dart';
import 'package:kalorize/app/data/model/recommendation_food.dart';
import 'package:kalorize/app/shared/widgets/home/food_card.dart';

class ListOfFoodBreakfastCard extends StatelessWidget {
  final RecommendationFood? food;
  final int length;
    final void Function()? onPressed;
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
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(right:12,),
          itemBuilder: (_, index) {
            var data = food?.breakfast?[index];
            return FoodCard(
              name: data?.nama ?? "",
              calori: data?.kalori ?? 0,
              protein: data?.protein ?? 0,
              onPressed: onPressed,
              itemId: data?.id ?? 0,
            );
          }),
    );
  }
}
