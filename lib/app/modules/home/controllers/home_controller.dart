import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DateTime selectedDate = DateTime.now();

  Future<void> showDate() async {
    DateTime currentDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime(1900), // Batasan hingga tanggal awal yang diinginkan
      lastDate: currentDate,     // Batasan hingga tanggal hari ini
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      update();
    }
  }
}
