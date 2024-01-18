import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kalorize/app/data/model/user_model.dart';
import 'package:kalorize/app/helpers/date_time_format.dart';
import 'package:kalorize/app/services/food_recommendation_service.dart';
import 'package:kalorize/app/services/input/recommendation_input.dart';
import 'package:kalorize/app/services/users_service.dart';

import '../../../data/model/recommendation_food.dart';

class HomeController extends GetxController {
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;
  RecommendationFood? recommendationFood = RecommendationFood();
  UserModel? user = UserModel();
  num currentCalories = 0.0;
  num currentProtein = 0.0;
  num totalCalories = 0.0;
  num totalProtein = 0.0;
  bool isLoading = true;
  @override
  void onInit() async {
    super.onInit();
    await getUser();
    getBreakfastFood();
    dateController.text = 'Hari ini, ${dateFormat(selectedDate)}';
  }

  Future<void> getUser() async {
    user = await UserService().fetchUserData();
    update();
  }

  Future<void> showDate() async {
    DateTime currentDate = DateTime.now();

    await initializeDateFormatting(); // Initialize date formatting

    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate ?? currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    selectedDate = pickedDate;

    String formattedPickedDate = DateFormat.yMd().format(pickedDate!);
    String formattedCurrentDate = DateFormat.yMd().format(currentDate);

    if (formattedPickedDate == formattedCurrentDate) {
      dateController.text = 'Hari ini, ${dateFormat(selectedDate)}';
    } else {
      dateController.text = dateFormat(selectedDate);
    }

    update();
  }

  void getBreakfastFood() async {
    RecommendationInput recommendationInput = RecommendationInput(
      age: user?.umur ?? 0,
      gender: user?.jenisKelamin ?? 0,
      activityLevel: user?.frekuensiGym ?? 0,
      target: user?.targetKalori ?? 0,
      height: user?.tinggiBadan ?? 0,
      weight: user?.beratBadan ?? 0,
    );

    recommendationFood = await FoodRecommendationService()
        .getRecommendation(recommendationInput: recommendationInput);
    update();
    isLoading = false;

    totalProtein = recommendationFood?.totalProtein ?? 0.0;
    totalCalories = recommendationFood?.totalCalories ?? 0.0;
    update();
  }

  Map<String, int?> selectedItems = {
    'breakfast': null,
    'lunch': null,
    'dinner': null,
  };

  // void selectItem(String mealType, int itemId) {
  //   int? selectedItemId = selectedItems[mealType];

  //   // Batalkan pemilihan item sebelumnya jika ada
  //   if (selectedItemId != null) {
  //     // Hapus kalori dan protein dari item yang dibatalkan jika indeks valid
  //     switch (mealType) {
  //       case 'breakfast':
  //         if (selectedItemId < (recommendationFood?.breakfast?.length ?? 0)) {
  //           currentCalories -=
  //               recommendationFood?.breakfast?[selectedItemId].kalori ?? 0;
  //           currentProtein -=
  //               recommendationFood?.breakfast?[selectedItemId].protein ?? 0;
  //         }
  //         break;
  //       case 'lunch':
  //         if (selectedItemId < (recommendationFood?.lunch?.length ?? 0)) {
  //           currentCalories -=
  //               recommendationFood?.lunch?[selectedItemId].kalori ?? 0;
  //           currentProtein -=
  //               recommendationFood?.lunch?[selectedItemId].protein ?? 0;
  //         }
  //         break;
  //       case 'dinner':
  //         if (selectedItemId < (recommendationFood?.dinner?.length ?? 0)) {
  //           currentCalories -=
  //               recommendationFood?.dinner?[selectedItemId].kalori ?? 0;
  //           currentProtein -=
  //               recommendationFood?.dinner?[selectedItemId].protein ?? 0;
  //         }
  //         break;
  //     }

  //     // Batalkan pemilihan
  //     selectedItems[mealType] = null;
  //   } else {
  //     // Jika belum ada pemilihan, pilih item baru
  //     int selectedIndex = -1;

  //     // Cari indeks dari item yang dipilih di dalam daftar makanan
  //     switch (mealType) {
  //       case 'breakfast':
  //         selectedIndex = recommendationFood?.breakfast
  //                 ?.indexWhere((item) => item.id == itemId) ??
  //             -1;
  //         break;
  //       case 'lunch':
  //         selectedIndex = recommendationFood?.lunch
  //                 ?.indexWhere((item) => item.id == itemId) ??
  //             -1;
  //         break;
  //       case 'dinner':
  //         selectedIndex = recommendationFood?.dinner
  //                 ?.indexWhere((item) => item.id == itemId) ??
  //             -1;
  //         break;
  //     }

  //     // Tambahkan kalori dan protein dari item yang dipilih jika indeks valid
  //     if (selectedIndex >= 0) {
  //       if (mealType == 'breakfast') {
  //         currentCalories +=
  //             recommendationFood?.breakfast?[selectedIndex].kalori ?? 0;
  //         currentProtein +=
  //             recommendationFood?.breakfast?[selectedIndex].protein ?? 0;
  //       } else if (mealType == 'lunch') {
  //         currentCalories +=
  //             recommendationFood?.lunch?[selectedIndex].kalori ?? 0;
  //         currentProtein +=
  //             recommendationFood?.lunch?[selectedIndex].protein ?? 0;
  //       } else if (mealType == 'dinner') {
  //         currentCalories +=
  //             recommendationFood?.dinner?[selectedIndex].kalori ?? 0;
  //         currentProtein +=
  //             recommendationFood?.dinner?[selectedIndex].protein ?? 0;
  //       }

  //       // Pilih item dengan indeks
  //       selectedItems[mealType] = selectedIndex;
  //     }
  //   }

  //   update();
  // }

  // void cancelSelection(String mealType) {
  //   // Ambil indeks item yang akan dibatalkan
  //   int? canceledItemIndex = selectedItems[mealType];

  //   if (canceledItemIndex != null) {
  //     // Hapus kalori dan protein dari item yang dibatalkan jika indeks valid
  //     switch (mealType) {
  //       case 'breakfast':
  //         if (canceledItemIndex <
  //             (recommendationFood?.breakfast?.length ?? 0)) {
  //           currentCalories -=
  //               recommendationFood?.breakfast?[canceledItemIndex].kalori ?? 0;
  //           currentProtein -=
  //               recommendationFood?.breakfast?[canceledItemIndex].protein ?? 0;
  //         }
  //         break;
  //       case 'lunch':
  //         if (canceledItemIndex < (recommendationFood?.lunch?.length ?? 0)) {
  //           currentCalories -=
  //               recommendationFood?.lunch?[canceledItemIndex].kalori ?? 0;
  //           currentProtein -=
  //               recommendationFood?.lunch?[canceledItemIndex].protein ?? 0;
  //         }
  //         break;
  //       case 'dinner':
  //         if (canceledItemIndex < (recommendationFood?.dinner?.length ?? 0)) {
  //           currentCalories -=
  //               recommendationFood?.dinner?[canceledItemIndex].kalori ?? 0;
  //           currentProtein -=
  //               recommendationFood?.dinner?[canceledItemIndex].protein ?? 0;
  //         }
  //         break;
  //     }

  //     selectedItems[mealType] = null;
  //     update();
  //   }
  // }
  void selectItem(String mealType, int itemId) {
    int? selectedItemId = selectedItems[mealType];
    if (selectedItemId != null && selectedItemId == itemId) {
      // Jika sudah dipilih, batalkan pemilihan
      cancelSelection(mealType);
    } else {
      // Jika belum dipilih, pilih item
      selectSingleItem(mealType, itemId);
    }
  }

  void selectSingleItem(String mealType, int itemId) {
    int selectedIndex = -1;

    // Cari indeks dari item yang dipilih di dalam daftar makanan
    switch (mealType) {
      case 'breakfast':
        selectedIndex = recommendationFood?.breakfast
                ?.indexWhere((item) => item.id == itemId) ??
            -1;
        break;
      case 'lunch':
        selectedIndex = recommendationFood?.lunch
                ?.indexWhere((item) => item.id == itemId) ??
            -1;
        break;
      case 'dinner':
        selectedIndex = recommendationFood?.dinner
                ?.indexWhere((item) => item.id == itemId) ??
            -1;
        break;
    }

    // Tambahkan kalori dan protein dari item yang dipilih jika indeks valid
    if (selectedIndex >= 0) {
      if (mealType == 'breakfast') {
        currentCalories +=
            recommendationFood?.breakfast?[selectedIndex].kalori ?? 0;
        currentProtein +=
            recommendationFood?.breakfast?[selectedIndex].protein ?? 0;
      } else if (mealType == 'lunch') {
        currentCalories +=
            recommendationFood?.lunch?[selectedIndex].kalori ?? 0;
        currentProtein +=
            recommendationFood?.lunch?[selectedIndex].protein ?? 0;
      } else if (mealType == 'dinner') {
        currentCalories +=
            recommendationFood?.dinner?[selectedIndex].kalori ?? 0;
        currentProtein +=
            recommendationFood?.dinner?[selectedIndex].protein ?? 0;
      }

      // Pilih item dengan indeks
      selectedItems[mealType] = itemId;
      update();
    }
  }

  void cancelSelection(String mealType) {
    // Ambil indeks item yang akan dibatalkan
    int? canceledItemIndex = selectedItems[mealType];

    if (canceledItemIndex != null) {
      // Hapus kalori dan protein dari item yang dibatalkan jika indeks valid
      switch (mealType) {
        case 'breakfast':
          if (canceledItemIndex <
              (recommendationFood?.breakfast?.length ?? 0)) {
            currentCalories -=
                recommendationFood?.breakfast?[canceledItemIndex].kalori ?? 0;
            currentProtein -=
                recommendationFood?.breakfast?[canceledItemIndex].protein ?? 0;
          }
          break;
        case 'lunch':
          if (canceledItemIndex < (recommendationFood?.lunch?.length ?? 0)) {
            currentCalories -=
                recommendationFood?.lunch?[canceledItemIndex].kalori ?? 0;
            currentProtein -=
                recommendationFood?.lunch?[canceledItemIndex].protein ?? 0;
          }
          break;
        case 'dinner':
          if (canceledItemIndex < (recommendationFood?.dinner?.length ?? 0)) {
            currentCalories -=
                recommendationFood?.dinner?[canceledItemIndex].kalori ?? 0;
            currentProtein -=
                recommendationFood?.dinner?[canceledItemIndex].protein ?? 0;
          }
          break;
      }

      // Batalkan pemilihan
      selectedItems[mealType] = null;
      update();
    }
  }
}
