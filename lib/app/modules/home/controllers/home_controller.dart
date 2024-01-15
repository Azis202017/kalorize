import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kalorize/app/helpers/date_time_format.dart';

class HomeController extends GetxController {
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;
  @override
  void onInit() {
    super.onInit();

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
}
