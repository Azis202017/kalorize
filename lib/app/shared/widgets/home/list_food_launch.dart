import 'package:flutter/widgets.dart';
import 'package:kalorize/app/data/model/recommendation_food.dart';
import 'package:kalorize/app/shared/widgets/home/food_card.dart';

class ListOfLaunchFood extends StatelessWidget {
  final RecommendationFood? food;
  final int length;
  final void Function(Breakfast)? onPressed;
  const ListOfLaunchFood({
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
        itemBuilder: (_, index) {
          var data = food?.lunch?[index];
          return FoodCard(
            name: data?.nama ?? "",
            calori: data?.kalori ?? 0,
            protein: data?.protein ?? 0,
            itemId: data?.id ?? 0,
            mealType: "lunch",
            image: data?.foto ?? "",

            onPressed: () => onPressed?.call(data!),
          );
        },
      ),
    );
  }
}
