import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/full_size_button.dart';
import 'package:kalorize/app/shared/widgets/text_input.dart';

import '../../../shared/widgets/welcome_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(
                    height: 42,
                  ),
                  const Welcome(
                    title: "Selamat Datang  👋",
                    subtitle: "Bikin akun dulu yuk.",
                  ).animate().fadeIn(),
                  const SizedBox(
                    height: 28,
                  ),
                  TextInput(
                    title: "Nama Lengkap",
                    textEditingController: controller.nameEdtController,
                    hintText: 'Contoh: John Doe',
                    onChange: controller.onChangeName,
                    focusNode: controller.nameFocusNode,
                    onEditingComplete: controller.onNameSubmitted,
                  ).animate().fadeIn(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    title: "Email",
                    textEditingController: controller.emailEdtController,
                    hintText: 'Contoh: user@gmail.com',
                    onChange: controller.onChangeEmail,
                    focusNode: controller.emailFocusNode,
                    onEditingComplete: controller.onEmailSubmitted,
                  ).animate().fadeIn(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    title: "Password",
                    isShowPassword: controller.isObsecureTextPassword,
                    showPassword: controller.showPassword,
                    onChange: controller.onChangePassword,
                    focusNode: controller.passwordFocusNode,
                    onEditingComplete: controller.onPasswordSubmitted,
                    textEditingController: controller.passwordEdtController,
                    hintText: 'Minimal 8 karakter',
                  ).animate().fadeIn(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    title: "Konfirmasi Password",
                    isShowPassword: controller.isObsecureTextConfirmPassword,
                    showPassword: controller.showConfirmPassword,
                    onChange: controller.onChangeConfirm,
                    focusNode: controller.confirmPasswordFocusNode,
                    onEditingComplete: controller.onConfirmPasswordSubmitted,
                    textEditingController: controller.confirmPasswordController,
                    hintText: 'Masukkan konfirmasi password',
                  ).animate().fadeIn(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    title: "Kode Gym",
                    textEditingController: controller.kodeGymEdtController,
                    hintText: 'Masukkan kode gym',
                    onChange: controller.onChangeKodeGym,
                  ).animate().fadeIn(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    title: "Kode Referral (Opsional)",
                    textEditingController: controller.kodeReferralEdtController,
                    onChange: controller.onChangeKodeReferral,
                    hintText: 'Masukkan kode referral',
                  ).animate().fadeIn(),
                  const SizedBox(
                    height: 28,
                  ).animate().fadeIn(),
                  FullSizeButton(
                    title: "Daftar",
                    onPressed: controller.isActiveButtonDaftar ? controller.register : null,
                  ).animate().fadeIn(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
