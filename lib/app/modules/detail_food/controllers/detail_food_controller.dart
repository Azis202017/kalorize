import 'package:get/get.dart';
import 'package:kalorize/app/data/model/detail_food.dart';
import 'package:kalorize/app/data/model/recommendation_food.dart';
import 'package:kalorize/app/services/food_recommendation_service.dart';

class DetailFoodController extends GetxController {
  Breakfast food = Get.arguments['food'];
  DetailFood? detailFood = DetailFood();
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();
    getFoodId();
  }

  void getFoodId() async {
    detailFood = await FoodRecommendationService().getDetailFood(id: food.id);
    isLoading = false;
    update();
  }
}
