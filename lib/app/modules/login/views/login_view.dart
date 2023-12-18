import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/shared/theme/font.dart';

import '../../../shared/widgets/logo_widget.dart';
import '../../../shared/widgets/text_input.dart';
import '../../../shared/widgets/welcome_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const CenterLogo(logo: 'logo'),
                const SizedBox(
                  height: 61,
                ),
                const Welcome(
                  title: "Halo Lagi 😄",
                  subtitle: "Masuk dulu yuk.",
                ),
                const SizedBox(
                  height: 20,
                ),
                TextInput(
                  title: 'Email',
                  textEditingController: controller.emailEditingController,
                  hintText: 'example@gmail.com',
                  validator: controller.emailValidate,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextInput(
                    title: 'Password',
                    textEditingController: controller.passwordEditingController,
                    hintText: '********',
                    validator: controller.passwordValidate,
                    isShowPassword: controller.isObsecureText,
                    showPassword: controller.showPassword),
                const SizedBox(
                  height: 60,
                ),
                FullSizeButton(
                  title: 'Masuk',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FullSizeButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const FullSizeButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
