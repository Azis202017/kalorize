import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/headers_with_button.dart';

import '../../../shared/widgets/text_input.dart';
import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(builder: (_) {
      return Form(
        key: controller.formKey,
        child: Scaffold(
          appBar: HeaderWithButton(
            title: 'Password',
            onTap: controller.changeButtonActive()
                ? controller.changePassword
                : null,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInput(
                    textInputType: TextInputType.name,
                    title: 'Password lama',
                    textEditingController:
                        controller.currentPasswordEditingController,
                    validator: controller.onValidateCurrentPassword,
                    onEditingComplete: controller.onSubmittedCurrentPassword,
                    onChange: controller.onChangeCurrentPassword,
                    showPassword: controller.changeCurrentPasswordObsecure,
                    hintText: 'Masukkan password lama',
                    isShowPassword: controller.isObsecureCurrentPassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    title: 'Password Baru',
                    validator: controller.onValidateNewPassword,
                    textEditingController:
                        controller.newPasswordEditingController,
                    onEditingComplete: controller.onSubmittedNewPassword,
                    onChange: controller.onChangeNewPassword,
                    hintText: 'Masukkan password baru',
                    isShowPassword:controller.isObsecureNewPassword,
                    showPassword: controller.changeNewPasswordObsecure,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInput(
                    textInputType: TextInputType.number,
                    title: 'Konfirmasi Password Baru',
                    textEditingController:
                        controller.confirmNewPasswordEditingController,
                    hintText: 'Masukkan Konfirmasi Password',
                    onChange: controller.onChangeConfirmNewPassword,
                    validator: controller.onValidateConfirmNewPassword,
                    showPassword: controller.changeConfirmNewPasswordObsecure,
                    isShowPassword: controller.isObsecureConfirmNewPassword,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
