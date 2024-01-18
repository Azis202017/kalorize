import 'dart:convert';

import 'package:http/http.dart';
import 'package:kalorize/app/data/model/detail_food.dart';
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
      Uri.parse(mlUrlTF),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return RecommendationFood.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<DetailFood?> getDetailFood({required int? id}) async {
    try {
      String url = "$apiUrl/makanan/$id";
      var response = await get(
        Uri.parse(url),
        headers: {
          'Authorization' : 'Bearer ${storage.read('token')}'
        }
      );
      print(response.body);
      if(response.statusCode == 200) {
        return DetailFood.fromJson(jsonDecode(response.body)['data']);
      }
      return null;
    } catch (e) {}
    return null;
  }
}
