import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/helpers/alert_success.dart';
import 'package:kalorize/app/services/auth_service.dart';

import '../../../routes/app_pages.dart';
import '../../../services/input/register_input.dart';

class RegisterController extends GetxController {
  TextEditingController nameEdtController = TextEditingController();
  TextEditingController emailEdtController = TextEditingController();
  TextEditingController passwordEdtController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController kodeGymEdtController = TextEditingController();
  TextEditingController kodeReferralEdtController = TextEditingController();
  String? name = "";
  String? email = "";
  String? password = "";
  String? confirm = "";
  String? kodeGym = "";
  String? kodeReferral = "";
  bool isActiveButtonDaftar = false;
  final nameFocusNode = FocusNode();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  void updateButtonStatus() {
    isActiveButtonDaftar = name?.isNotEmpty == true &&
        email?.isNotEmpty == true &&
        password?.isNotEmpty == true &&
        confirm?.isNotEmpty == true &&
        kodeGym?.isNotEmpty == true &&
        password == confirm; // Check if password and confirm password match
    update();
  }

  String? onChangeName(String? value) {
    name = value;
    updateButtonStatus();
    return name;
  }

  String? onChangeEmail(String? value) {
    email = value;
    updateButtonStatus();
    return email;
  }

  String? onChangePassword(String? value) {
    password = value;
    updateButtonStatus();
    return password;
  }

  String? onChangeConfirm(String? value) {
    confirm = value;
    updateButtonStatus();
    return confirm;
  }

  String? onChangeKodeGym(String? value) {
    kodeGym = value;
    updateButtonStatus();
    return kodeGym;
  }

  String? onChangeKodeReferral(String? value) {
    kodeReferral = value;
    updateButtonStatus();
    return kodeReferral;
  }

  bool isObsecureTextPassword = true;
  bool isObsecureTextConfirmPassword = true;

  void showPassword() {
    isObsecureTextPassword = !isObsecureTextPassword;
    update();
  }

  void showConfirmPassword() {
    isObsecureTextConfirmPassword = !isObsecureTextConfirmPassword;
    update();
  }

  void onNameSubmitted() {
    FocusScope.of(Get.context!).requestFocus(emailFocusNode);
  }

  void onEmailSubmitted() {
    FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
  }

  void onPasswordSubmitted() {
    FocusScope.of(Get.context!).requestFocus(
      confirmPasswordFocusNode,
    );
  }

  void onConfirmPasswordSubmitted() {
    FocusScope.of(Get.context!).requestFocus(
      confirmPasswordFocusNode,
    );
  }

  void register() async {
    RegisterInput registerInput = RegisterInput(
      email: emailEdtController.text,
      nama: nameEdtController.text,
      password: passwordEdtController.text,
      passwordConfirmation: confirmPasswordController.text,
      kodeGym: kodeGymEdtController.text,
      kodeReferral: kodeReferralEdtController.text,
    );
    bool isSuccessRegister = await AuthService().register(registerInput);
    if (isSuccessRegister) {
      alertSuccess(
        title: "Selamat Kamu Berhasil Daftar!",
        subtitle: "Tunggu beberapa saat lagi",
      );
      clearForm();

      Get.toNamed(Routes.LOGIN);
    } else {}
  }

  void clearForm() {
    nameEdtController.text = "";
    emailEdtController.text = "";
    passwordEdtController.text = "";
    confirmPasswordController.text = "";
    kodeGymEdtController.text = "";
    kodeReferralEdtController.text = "";
  }
}
