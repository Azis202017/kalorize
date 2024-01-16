// To parse this JSON data, do
//
//     final recommendationFood = recommendationFoodFromJson(jsonString);

import 'dart:convert';

RecommendationFood recommendationFoodFromJson(String str) => RecommendationFood.fromJson(json.decode(str));

String recommendationFoodToJson(RecommendationFood data) => json.encode(data.toJson());

class RecommendationFood {
    List<Breakfast>? breakfast;
    List<Breakfast>? launch;
    List<Breakfast>? dinner;
    int? totalCalories;
    int? totalProtein;

    RecommendationFood({
        this.breakfast,
        this.launch,
        this.dinner,
        this.totalCalories,
        this.totalProtein,
    });

    factory RecommendationFood.fromJson(Map<String, dynamic> json) => RecommendationFood(
        breakfast: json["Breakfast"] == null ? [] : List<Breakfast>.from(json["Breakfast"]!.map((x) => Breakfast.fromJson(x))),
        launch: json["Launch"] == null ? [] : List<Breakfast>.from(json["Launch"]!.map((x) => Breakfast.fromJson(x))),
        dinner: json["Dinner"] == null ? [] : List<Breakfast>.from(json["Dinner"]!.map((x) => Breakfast.fromJson(x))),
        totalCalories: json["total_calories"],
        totalProtein: json["total_protein"],
    );

    Map<String, dynamic> toJson() => {
        "Breakfast": breakfast == null ? [] : List<dynamic>.from(breakfast!.map((x) => x.toJson())),
        "Launch": launch == null ? [] : List<dynamic>.from(launch!.map((x) => x.toJson())),
        "Dinner": dinner == null ? [] : List<dynamic>.from(dinner!.map((x) => x.toJson())),
        "total_calories": totalCalories,
        "total_protein": totalProtein,
    };
}

class Breakfast {
    int? kalori;
    String? nama;
    int? protein;
    int? id;

    Breakfast({
        this.kalori,
        this.nama,
        this.protein,
        this.id,
    });

    factory Breakfast.fromJson(Map<String, dynamic> json) => Breakfast(
        kalori: json["Kalori"],
        nama: json["Nama"],
        protein: json["Protein"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "Kalori": kalori,
        "Nama": nama,
        "Protein": protein,
        "id": id,
    };
}
