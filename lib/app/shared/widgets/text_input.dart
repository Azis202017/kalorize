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
  final void Function()? onTap;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final bool readOnly;

  const TextInput({
    Key? key,
    required this.title,
    this.showPassword,
    this.hintText,
    required this.textEditingController,
    this.isShowPassword,
    this.validator,
    this.onChange,
    this.onEditingComplete,
    this.focusNode,
    this.textInputType,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

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
          onTap: onTap,
          readOnly: readOnly,
          controller: textEditingController,
          obscureText: isShowPassword ?? false,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onEditingComplete: onEditingComplete,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            suffixIcon: _buildSuffixIcon(),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (isShowPassword != null) {
      if (isShowPassword!) {
        return GestureDetector(
          onTap: showPassword,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset(
              'assets/svg/eye-slash.svg',
              width: 20,
              height: 20,
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: showPassword,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset(
              'assets/svg/eye.svg',
              width: 20,
              height: 20,
            ),
          ),
        );
      }
    } else {
      // Tambahkan ikon kalender di sini
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Image.asset(
          'assets/img/calendar.png',
          width:20, height:20,
        ),
      );
    }
  }
}
