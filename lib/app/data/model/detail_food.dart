
import 'dart:convert';

DetailFood detailFoodFromJson(String str) => DetailFood.fromJson(json.decode(str));

String detailFoodToJson(DetailFood data) => json.encode(data.toJson());

class DetailFood {
    String? id;
    String? nama;
    String? jenis;
    List<String>? bahan;
    List<String>? cookingStep;
    int? kalori;
    int? protein;
    String? foto;

    DetailFood({
        this.id,
        this.nama,
        this.jenis,
        this.bahan,
        this.cookingStep,
        this.kalori,
        this.protein,
        this.foto,
    });

    factory DetailFood.fromJson(Map<String, dynamic> json) => DetailFood(
        id: json["ID"],
        nama: json["Nama"],
        jenis: json["Jenis"],
        bahan: json["Bahan"] == null ? [] : List<String>.from(json["Bahan"]!.map((x) => x)),
        cookingStep: json["CookingStep"] == null ? [] : List<String>.from(json["CookingStep"]!.map((x) => x)),
        kalori: json["Kalori"],
        protein: json["Protein"],
        foto: json["Foto"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Nama": nama,
        "Jenis": jenis,
        "Bahan": bahan == null ? [] : List<dynamic>.from(bahan!.map((x) => x)),
        "CookingStep": cookingStep == null ? [] : List<dynamic>.from(cookingStep!.map((x) => x)),
        "Kalori": kalori,
        "Protein": protein,
        "Foto": foto,
    };
}
