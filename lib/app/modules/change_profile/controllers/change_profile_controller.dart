import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/helpers/alert_confirm.dart';

class ChangeProfileController extends GetxController {
  TextEditingController namaEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController noTeleponController = TextEditingController();

  final GlobalKey formKey = GlobalKey<FormState>();
  FocusNode namaFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode noTeleponFocusNode = FocusNode();

  String nama = "";
  String email = "";
  String noTelepon = "";

  String? onChangeNama(String? value) {
    nama = value!;
    update();
    return nama;
  }

  String? onChangeEmail(String? value) {
    email = value!;

    update();
    return email;
  }

  String? onChangeNomorTelepon(String? value) {
    noTelepon = value!;
    update();
    return noTelepon;
  }

  bool isButtonSaveActive = false;

  void onSubmittedNama() {
    FocusScope.of(Get.context!).requestFocus(emailFocusNode);
  }

  void onSubmittedEmail() {
    FocusScope.of(Get.context!).requestFocus(noTeleponFocusNode);
  }

  String? onValidateNama(String? value) {
    if (value!.isEmpty) {
      return "Mohon isi nama nya terlebih dahulu";
    }
    return null;
  }

  String? onValidateEmail(String? value) {
    if (value!.isEmpty) {
      return "Mohon isi nama nya terlebih dahulu";
    } else if (!value.contains("@")) {
      return "Tambahkan @ untuk email yang benar";
    }
    return null;
  }

  String? onValidateNomorTelepon(String? value) {
    if (value!.isEmpty) {
      return "Mohon isi nomor telepon nya terlebih dahulu";
    }
    return null;
  }

  bool changeButtonActive() {
    isButtonSaveActive = nama.isNotEmpty &&
        email.isNotEmpty &&
        email.contains("@") &&
        noTelepon.isNotEmpty;
    print(isButtonSaveActive);
    update();
    return isButtonSaveActive;
  }

  void changeProfile() {
    alertConfirm(
      title: 'Apakah kamu yakin ingin menyimpan perubahan?',
      saveButtonTap: () {},
      cancelButtonTap: () {},
    );
  }
}
