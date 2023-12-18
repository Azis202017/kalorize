import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/services/auth_service.dart';
import 'package:kalorize/app/services/input/login_input.dart';
import 'package:kalorize/app/shared/theme/color.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool isObsecureText = true;
  String? emailValidate(String? value) {
    if (value!.isEmpty) {
      return "Email harus diisi terlebih dahulu";
    } else if (!value.contains("@")) {
      return "Tambahakn @ di email mu supaya valid";
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (value!.isEmpty) {
      return "Password harus diisi terlebih dahulu";
    }
    return null;
  }

  void showPassword()  {
    isObsecureText = !isObsecureText;
    update();
  }

  void login() async {
    LoginInput login = LoginInput(
        email: emailEditingController.text,
        password: passwordEditingController.text);
    bool isLoginSuccess = await AuthService().login(login);
    if (isLoginSuccess) {
      Get.snackbar(
        "Berhasil Masuk",
        "Anda akan diarahkan ke halaman home",
        colorText: whiteColor,
        backgroundColor: Colors.green.shade400,
      );
    } else {
      Get.snackbar(
        "Gagal Masuk",
        "Username atau password salah silahkan masukkan lagi",
        colorText: whiteColor,
        backgroundColor: error,
      );
    }
  }
  void toRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }
}
