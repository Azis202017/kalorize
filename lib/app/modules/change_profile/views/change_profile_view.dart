import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/headers_with_button.dart';
import 'package:kalorize/app/shared/widgets/text_input.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  const ChangeProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeProfileController>(
      builder: (_) {
        return Form(
          key: controller.formKey,
          child: Scaffold(
            appBar:  HeaderWithButton(
              title: 'Ubah Profile',
              onTap: controller.changeButtonActive() ? controller.changeProfile : null,
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
                      title: 'Nama Lengkap',
                      textEditingController: controller.namaEditingController,
                      validator: controller.onValidateNama,
                      onEditingComplete: controller.onSubmittedNama,
                      onChange: controller.onChangeNama,

                      hintText: 'John doe',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextInput(
                      title: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validator: controller.onValidateEmail,
                      textEditingController: controller.emailEditingController,
                      onEditingComplete: controller.onSubmittedEmail,
                      onChange: controller.onChangeEmail,

                      hintText: 'user@gmail.com',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextInput(
                      textInputType: TextInputType.number,
                      title: 'Nomor Telepon',
                      textEditingController: controller.noTeleponController,
                      hintText: '082211222',
                      validator: controller.onValidateNomorTelepon,
                      onChange: controller.onChangeNomorTelepon,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
