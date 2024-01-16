import 'package:flutter/widgets.dart';
import 'package:kalorize/app/data/model/recommendation_food.dart';
import 'package:kalorize/app/shared/widgets/home/food_card.dart';

class ListOfDinnerFood extends StatelessWidget {
  final RecommendationFood? food;
  final int length;
  final void Function()? onPressed;
  const ListOfDinnerFood({
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
        itemBuilder: (_, index) {
          var data = food?.dinner?[index];
          return FoodCard(
            name: data?.nama ?? "",
            calori: data?.kalori ?? 0,
            protein: data?.protein ?? 0,
            itemId: data?.id ?? 0,
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}
