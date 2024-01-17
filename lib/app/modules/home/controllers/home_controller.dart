import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kalorize/app/helpers/date_time_format.dart';

import '../../../data/model/recommendation_food.dart';

class HomeController extends GetxController {
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;
  RecommendationFood recommendationFood = RecommendationFood();

  @override
  void onInit() {
    super.onInit();
    getBreakfastFood();
    dateController.text = 'Hari ini, ${dateFormat(selectedDate)}';
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

    if (pickedDate != null) {
      selectedDate = pickedDate;

      String formattedPickedDate = DateFormat.yMd().format(pickedDate);
      String formattedCurrentDate = DateFormat.yMd().format(currentDate);

      if (formattedPickedDate == formattedCurrentDate) {
        dateController.text = 'Hari ini, ${dateFormat(selectedDate)}';
      } else {
        dateController.text = dateFormat(selectedDate);
      }

      print(formattedPickedDate == formattedCurrentDate);

      update();
    }
  }

  void getBreakfastFood() async {
    recommendationFood = RecommendationFood(
      breakfast: [
        Breakfast(
          kalori: 200,
          nama: "Telur rebus",
          protein: 72,
          id: 20,
        ),
        Breakfast(
          kalori: 80,
          nama: "Telur Dadar",
          protein: 70,
          id: 50,
        ),
      ],
      dinner: [
        Breakfast(
          kalori: 200,
          nama: "Telur rebus",
          protein: 72,
          id: 80,
        ),
        Breakfast(
          kalori: 80,
          nama: "Telur Dadar",
          protein: 70,
          id: 100,
        ),
      ],
      launch: [
        Breakfast(
          kalori: 200,
          nama: "Telur rebus",
          protein: 72,
          id: 120,
        ),
        Breakfast(
          kalori: 80,
          nama: "Telur Dadar",
          protein: 70,
          id: 150,
        ),
      ],
    );
  }

  final Map<int, bool> isSelected = {};
  void toggleSelection(int itemId) {
    isSelected[itemId] = !(isSelected[itemId] ?? false);
    update();
  }
}
