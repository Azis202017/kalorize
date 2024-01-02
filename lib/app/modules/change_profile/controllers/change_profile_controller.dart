import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  final formKey = GlobalKey<FormState>;
  FocusNode namaFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode noTeleponFocusNode = FocusNode();

  String? nama = "";
  String? email = "";
  String? noTelepon = "";

  String? onChangeNama(String? value) => nama = value;
  String? onChangeEmail(String? value) => email = value;
  String? onChangeNomorTelepon(String? value) => noTelepon = value;

  void onSubmittedNama() {
    FocusScope.of(Get.context!).requestFocus(emailFocusNode);
  }
  void onSubmittedEmail() {
    FocusScope.of(Get.context!).requestFocus(noTeleponFocusNode);
  }
  
  
}
