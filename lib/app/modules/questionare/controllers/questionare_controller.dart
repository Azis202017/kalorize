import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/helpers/alert_error.dart';
import 'package:kalorize/app/helpers/alert_loading.dart';
import 'package:kalorize/app/services/questionare_service.dart';

import '../../../data/model/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/input/questionare_input.dart';
import '../../../services/users_service.dart';

class QuestionareController extends GetxController {
  UserModel? user = UserModel();
  String umur = "";
  String beratBadan = "";
  String tinggiBadan = "";
  FocusNode focusNodeUmur = FocusNode();
  FocusNode focusNodeBeratBadan = FocusNode();
  int currentGender = -1;
  int currentFrequencyGym = -1;
  int currentTarget = -1;
  int currentIndex = 0;

  FocusNode focusNodeTinggiBadan = FocusNode();
  bool isButtonActive = false;
  TextEditingController umurEdtController = TextEditingController();
  TextEditingController beratBadanEdtController = TextEditingController();
  TextEditingController tinggiBadanEdtController = TextEditingController();
  final PageController pageController = PageController();
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

  bool activeButtonSave() {
    return currentTarget != -1 &&
        currentFrequencyGym != -1 &&
        umur.isNotEmpty &&
        beratBadan.isNotEmpty &&
        tinggiBadan.isNotEmpty &&
        currentGender != -1;
  }

  void saveQuestionare() async {
    if (user != null) {
      QuestionareInput questionareInput = QuestionareInput(
        idUser: user?.idUser ?? "",
        umur: int.parse(umur),
        beratBadan: int.parse(beratBadan),
        frekuensiGym: currentFrequencyGym,
        jenisKelamin: currentGender,
        targetKalori: currentTarget,
        tinggiBadan: int.parse(tinggiBadan),
      );
      alertLoading();
      bool isSuccessfullFillQuestionare = await QuestionareService()
          .fillQuestion(questionareInput: questionareInput);
      Get.back();
      if (isSuccessfullFillQuestionare) {
        Get.offAllNamed(Routes.AFTER_QUESTIONARE,
            arguments: {"isSuccess": isSuccessfullFillQuestionare});
      } else {
        Get.offAllNamed(
          Routes.AFTER_QUESTIONARE,
          arguments: {"isSuccess": isSuccessfullFillQuestionare},
        );
      }
    } else {
      alertError(
        title: 'Terjadi Kesalahan',
        subtitle: 'User tidak ditemukan',
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();

    super.onClose();
  }

  void nextPage() {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      update();
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex;
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      update();
    }
  }

  Future<void> getUserData() async {
    user = await UserService().fetchUserData();
    print(user);
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
  }
}
