import 'package:flutter/material.dart';

import '../theme/font.dart';

class TextInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final String? hintText;
  final void Function()? showPassword;
  final bool? isShowPassword;
  final String? Function(String?)? validator;
  const TextInput({
    super.key,
    required this.title,
    this.showPassword,
    this.hintText,
    required this.textEditingController,
    this.isShowPassword,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: body2Medium,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: textEditingController,
          obscureText: isShowPassword ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              suffixIcon: isShowPassword != null
                  ? GestureDetector(
                      onTap: showPassword,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Image.asset(
                          isShowPassword == true
                              ? 'assets/svg/eye-slash.png'
                              : 'assets/svg/eye.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  : null),
        ),
      ],
    );
  }
}
