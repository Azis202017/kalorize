import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/helpers/alert_confirm.dart';
import 'package:kalorize/app/helpers/alert_loading.dart';
import 'package:kalorize/app/helpers/alert_success.dart';
import 'package:kalorize/app/services/input/change_profile_input.dart';
import 'package:kalorize/app/services/users_service.dart';

import '../../../constant/global.dart';
import '../../../routes/app_pages.dart';

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
    update();
    return isButtonSaveActive;
  }

  void changeProfile() {
    alertConfirm(
      title: 'Apakah kamu yakin ingin menyimpan perubahan?',
      saveButtonTap: saveProfile,
      cancelButtonTap: () {
        Get.back();
      },
    );
  }

  void saveProfile() async {
    Get.back();
    ChangeProfileInput changeProfileInput = ChangeProfileInput(
      name: nama,
      email: email,
      nomorTelepon: noTelepon,
    );
    alertLoading();
    bool isChangeProfileSuccess = await UserService().changeProfile(
      changeProfileInput: changeProfileInput,
    );
    Get.back();
    if (isChangeProfileSuccess) {
      Get.back();
      alertSuccess(title: 'Berhasil', subtitle: 'Ganti Profile Berhasil');
    } else {
      alertSuccess(title: 'Gagal', subtitle: 'Ganti Profile Gagal');
    }
  }
}
