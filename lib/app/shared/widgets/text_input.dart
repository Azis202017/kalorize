import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../theme/font.dart';

class TextInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final String? hintText;
  final void Function()? showPassword;
  final bool? isShowPassword;
  final String? Function(String?)? validator;
  final String? Function(String? value)? onChange;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  const TextInput({
    super.key,
    required this.title,
    this.showPassword,
    this.hintText,
    required this.textEditingController,
    this.isShowPassword,
    this.validator,
    this.onChange,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: labelLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          onChanged: onChange,
          controller: textEditingController,
          obscureText: isShowPassword ?? false,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onEditingComplete: onEditingComplete,
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
                        child: SvgPicture.asset(
                          isShowPassword == true
                              ? 'assets/svg/eye-slash.svg'
                              : 'assets/svg/eye.svg',
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
