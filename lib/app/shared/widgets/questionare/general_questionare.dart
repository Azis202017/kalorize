import 'package:flutter/material.dart';

import '../../theme/font.dart';
import '../full_size_button.dart';
import '../gender.dart';
import '../text_input.dart';

class GeneralQuestionare extends StatelessWidget {
  final bool isFemaleSelected;
  final bool isMaleSelected;
  final void Function() onMaleSelected;
  final void Function()? onTap;


  final void Function() onFemaleSelected;
  final void Function() onUmurSubmitted;
  final void Function() onBeratBadanSubmitted;
  final void Function()? onTinggiBadanSubmitted;

  final FocusNode focusUmur;
  final FocusNode focusBeratBadan;
  final FocusNode focusTinggiBadan;

  final TextEditingController controllerUmur;
  final TextEditingController controllerBeratBadan;
  final TextEditingController controllerTinggiBadan;
  final String? Function(String?)? validateUmur;
  final String? Function(String?)? validateBeratBadan;
  final String? Function(String?)? validateTinggiBadan;
  final String? Function(String?)? onChangeUmur;

  final String? Function(String?)? onChangeBeratBadan;

  final String? Function(String?)? onChangeTinggiBadan;

  const GeneralQuestionare({
    super.key,
    this.isFemaleSelected = false,
    this.isMaleSelected = false,
    required this.onFemaleSelected,
    required this.onMaleSelected,
    required this.controllerBeratBadan,
    required this.controllerTinggiBadan,
    required this.controllerUmur,
    this.validateUmur,
    this.validateBeratBadan,
    this.validateTinggiBadan,
    this.onChangeUmur,
    this.onChangeBeratBadan,
    this.onChangeTinggiBadan,
    required this.focusUmur,
    required this.focusBeratBadan,
    required this.focusTinggiBadan,
    required this.onBeratBadanSubmitted,
    this.onTinggiBadanSubmitted,
    required this.onUmurSubmitted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin',
          style: labelLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: GenderButton(
                label: 'Laki-laki',
                isSelected: isMaleSelected,
                onPressed: onMaleSelected,
                bottomLeftRadius: const Radius.circular(40),
                topLeftRadius: const Radius.circular(40),
              ),
            ),
            Expanded(
              child: GenderButton(
                label: 'Perempuan',
                isSelected: isFemaleSelected,
                onPressed: onFemaleSelected,
                bottomRightRadius: const Radius.circular(40),
                topRightRadius: const Radius.circular(40),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextInput(
          title: 'Umur',
          textInputType: TextInputType.number,
          textEditingController: controllerUmur,
          hintText: 'Contoh: 21',
          validator: validateUmur,
          onChange: onChangeUmur,
          focusNode: focusUmur,
          onEditingComplete: onUmurSubmitted,
        ),
        const SizedBox(
          height: 20,
        ),
        TextInput(
          title: 'Berat Badan (Kg)',
          textInputType: TextInputType.number,
          hintText: 'Contoh: 60',
          textEditingController: controllerBeratBadan,
          validator: validateBeratBadan,
          onChange: onChangeBeratBadan,
          onEditingComplete: onBeratBadanSubmitted,
          focusNode: focusBeratBadan,
        ),
        const SizedBox(
          height: 20,
        ),
        TextInput(
          title: 'Tinggi badan (cm)',
          textInputType: TextInputType.number,
          hintText: 'Contoh: 170',
          textEditingController: controllerTinggiBadan,
          validator: validateTinggiBadan,
          onChange: onChangeTinggiBadan,
          focusNode: focusTinggiBadan,
          onEditingComplete: onTinggiBadanSubmitted,
        ),
        const SizedBox(
          height: 28,
        ),
        PrimaryButton(
          title: 'Lanjutkan',
          height: 44,
          paddingTop: 8,
          paddingRight: 20,
          paddingLeft: 20,
          paddingBottom: 8,
          onPressed: onTap,
        ),
      ],
    );
  }
}
