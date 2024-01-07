import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/alert_confirm.dart';

class PasswordController extends GetxController {
  TextEditingController currentPasswordEditingController =
      TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController confirmNewPasswordEditingController =
      TextEditingController();
  bool isObsecureCurrentPassword = true;
  bool isObsecureNewPassword = true;
  bool isObsecureConfirmNewPassword = true;

  final formKey = GlobalKey<FormState>();
  FocusNode currentPasswordFocusNode = FocusNode();
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode confirmNewPasswordFocusNode = FocusNode();

  String currentPassword = "";
  String newPassword = "";
  String confirmNewPassword = "";

  String? onChangeCurrentPassword(String? value) {
    currentPassword = value!;
    update();
    return currentPassword;
  }

  String? onChangeNewPassword(String? value) {
    newPassword = value!;

    update();
    return newPassword;
  }

  String? onChangeConfirmNewPassword(String? value) {
    confirmNewPassword = value!;
    update();
    return confirmNewPassword;
  }

  bool isButtonSaveActive = false;

  void onSubmittedCurrentPassword() {
    FocusScope.of(Get.context!).requestFocus(currentPasswordFocusNode);
  }

  void onSubmittedNewPassword() {
    FocusScope.of(Get.context!).requestFocus(newPasswordFocusNode);
  }

  String? onValidateCurrentPassword(String? value) {
    if (value!.isEmpty) {
      return "Mohon isi password terbaru  terlebih dahulu";
    }
    return null;
  }

  String? onValidateNewPassword(String? value) {
    if (value!.isEmpty) {
      return "Mohon isi password baru  terlebih dahulu";
    }
    return null;
  }

  String? onValidateConfirmNewPassword(String? value) {
    if (value!.isEmpty) {
      return "Mohon isi konfirmasi password terlebih dahulu";
    }
    return null;
  }

  bool changeButtonActive() {
    isButtonSaveActive = currentPassword.isNotEmpty &&
        newPassword.isNotEmpty &&
        confirmNewPassword.isNotEmpty;
    update();
    return isButtonSaveActive;
  }
  
  void changePassword() {
    if (formKey.currentState!.validate()) {
      alertConfirm(
        title: 'Apakah kamu yakin ingin menyimpan perubahan',
        saveButtonTap: () {},
        cancelButtonTap: () {
          Get.back();
        },
      );
    }
  }

   void changeCurrentPasswordObsecure() {
    isObsecureCurrentPassword = !isObsecureCurrentPassword;
    update();
  }
   void changeNewPasswordObsecure() {
    isObsecureNewPassword = !isObsecureNewPassword;
    update();
  }   
   void changeConfirmNewPasswordObsecure() {
    isObsecureConfirmNewPassword = !isObsecureConfirmNewPassword;
    update();
  }       
}
