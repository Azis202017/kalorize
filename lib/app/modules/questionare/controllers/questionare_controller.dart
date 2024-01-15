import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuestionareController extends GetxController {
  String umur = "";
  String beratBadan = "";
  String tinggiBadan = "";
  FocusNode focusNodeUmur = FocusNode();
  FocusNode focusNodeBeratBadan = FocusNode();
  int currentGender = -1;
  int currentFrequencyGym = -1;
  int currentTarget = -1;

  FocusNode focusNodeTinggiBadan = FocusNode();
  bool isButtonActive = false;
  TextEditingController umurEdtController = TextEditingController();
  TextEditingController beratBadanEdtController = TextEditingController();
  TextEditingController tinggiBadanEdtController = TextEditingController();
  String? onChangeUmur(String? value) {
    umur = value ?? "";
    update();
    return umur;
  }

  String? onChangeBeratBadan(String? value) {
    beratBadan = value ?? "";
    update();
    return beratBadan;
  }

  String? onChangeTinggiBadan(String? value) {
    tinggiBadan = value ?? "";
    update();
    return tinggiBadan;
  }

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

  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  void onMaleSelected() {
    isMaleSelected = !isMaleSelected;
    currentGender = 0;
    isFemaleSelected = false;
    update();
  }

  void onFemaleSelected() {
    isFemaleSelected = !isFemaleSelected;
    currentGender = 1;
    isMaleSelected = false;
    update();
  }

  void onSubmittedUmur() {
    FocusScope.of(Get.context!).requestFocus(focusNodeBeratBadan);

    update();
  }

  void onSubmittedBeratBadan() {
    FocusScope.of(Get.context!).requestFocus(focusNodeTinggiBadan);

    update();
  }

  bool activeButton() {
    isButtonActive = umur.isNotEmpty &&
        beratBadan.isNotEmpty &&
        tinggiBadan.isNotEmpty &&
        currentGender != -1;
    return isButtonActive;
  }

  void gymFrequencyExtreme() {
    currentFrequencyGym = 0;
    update();
  }

  void gymFrequencyHard() {
    currentFrequencyGym = 1;
    update();
  }

  void gymFrequencyMedium() {
    currentFrequencyGym = 2;
    update();
  }

  void gymFrequencyEasy() {
    currentFrequencyGym = 3;
    update();
  }
   void targetReduceWeight() {
    currentTarget = 0;
    update();
  }

  void targetIncreaseMuscle() {
    currentTarget = 1;
    update();
  }

  void targetBeHealthy() {
    currentTarget = 2;
    update();
  }
}
