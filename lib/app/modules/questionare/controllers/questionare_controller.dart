import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuestionareController extends GetxController {
  TextEditingController umur = TextEditingController();
  TextEditingController beratBadan = TextEditingController();
  TextEditingController tinggiBadan = TextEditingController();

  String? validateUmur(String? value) {
    if (value == null || value.isEmpty) {
      return "Umur tidak boleh kosong";
    }

    try {
      int umur = int.parse(value);
      if (umur < 0) {
        return "Umur tidak boleh negatif";
      }
    } catch (e) {
      return "Umur harus berupa angka";
    }

    return null;
  }

  String? validateBeratBadan(String? value) {
    if (value == null || value.isEmpty) {
      return "Berat badan tidak boleh kosong";
    }

    try {
      double beratBadan = double.parse(value);
      if (beratBadan < 0) {
        return "Berat badan tidak boleh negatif";
      }
    } catch (e) {
      return "Berat badan harus berupa angka";
    }

    return null;
  }

  String? validateTinggiBadan(String? value) {
    if (value == null || value.isEmpty) {
      return "Tinggi badan tidak boleh kosong";
    }

    try {
      int tinggiBadan = int.parse(value);
      if (tinggiBadan < 0) {
        return "Tinggi badan tidak boleh negatif";
      }
    } catch (e) {
      return "Tinggi badan harus berupa angka";
    }

    return null;
  }
}
