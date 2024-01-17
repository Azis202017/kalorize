import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:kalorize/app/data/model/recommendation_food.dart';
import 'package:kalorize/app/services/input/recommendation_input.dart';

import '../constant/global.dart';

class FoodRecommendationService {
  Future<RecommendationFood?> getRecommendation({
    required RecommendationInput recommendationInput,
  }) async {
    Map<String, dynamic> body = {
      'gender': recommendationInput.gender,
      'weight': recommendationInput.weight,
      'height': recommendationInput.height,
      'age': recommendationInput.age,
      'activity_level': recommendationInput.activityLevel,
      'target': recommendationInput.target,
    };
    final response = await post(
      Uri.parse(mlUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return RecommendationFood.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
