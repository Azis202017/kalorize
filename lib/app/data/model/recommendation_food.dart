// To parse this JSON data, do
//
//     final recommendationFood = recommendationFoodFromJson(jsonString);

import 'dart:convert';

RecommendationFood recommendationFoodFromJson(String str) => RecommendationFood.fromJson(json.decode(str));

String recommendationFoodToJson(RecommendationFood data) => json.encode(data.toJson());

class RecommendationFood {
    List<Breakfast>? breakfast;
    List<Breakfast>? dinner;
    List<Breakfast>? lunch;
    num? totalCalories;
    num? totalProtein;

    RecommendationFood({
        this.breakfast,
        this.dinner,
        this.lunch,
        this.totalCalories,
        this.totalProtein,
    });

    factory RecommendationFood.fromJson(Map<String, dynamic> json) => RecommendationFood(
        breakfast: json["Breakfast"] == null ? [] : List<Breakfast>.from(json["Breakfast"]!.map((x) => Breakfast.fromJson(x))),
        dinner: json["Dinner"] == null ? [] : List<Breakfast>.from(json["Dinner"]!.map((x) => Breakfast.fromJson(x))),
        lunch: json["Lunch"] == null ? [] : List<Breakfast>.from(json["Lunch"]!.map((x) => Breakfast.fromJson(x))),
        totalCalories: json["total_calories"],
        totalProtein: json["total_protein"],
    );

    Map<String, dynamic> toJson() => {
        "Breakfast": breakfast == null ? [] : List<dynamic>.from(breakfast!.map((x) => x.toJson())),
        "Dinner": dinner == null ? [] : List<dynamic>.from(dinner!.map((x) => x.toJson())),
        "Lunch": lunch == null ? [] : List<dynamic>.from(lunch!.map((x) => x.toJson())),
        "total_calories": totalCalories,
        "total_protein": totalProtein,
    };
}

class Breakfast {
    String? foto;
    num? kalori;
    String? nama;
    num? protein;
    int? id;

    Breakfast({
        this.foto,
        this.kalori,
        this.nama,
        this.protein,
        this.id,
    });

    factory Breakfast.fromJson(Map<String, dynamic> json) => Breakfast(
        foto: json["Foto"],
        kalori: json["kalori"],
        nama: json["nama"],
        protein: json["protein"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "Foto": foto,
        "Kalori": kalori,
        "Nama": nama,
        "Protein": protein,
        "id": id,
    };
}
