import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/text_input.dart';

import '../controllers/questionare_controller.dart';

class QuestionareView extends GetView<QuestionareController> {
  const QuestionareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuestionareView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInput(
                title: 'Umur',
                textInputType: TextInputType.number,
                textEditingController: controller.umur,
                hintText: 'Contoh: 21',

                validator: controller.validateUmur,
              ),
              const SizedBox(
                height: 20,
              ),
              TextInput(
                title: 'Berat Badan (Kg)',
                textInputType: TextInputType.number,
                hintText: 'Contoh: 60',
                textEditingController: controller.beratBadan,
                validator: controller.validateBeratBadan,
              ),
              const SizedBox(
                height: 20,
              ),
              TextInput(
                title: 'Tinggi badan (cm)',
                textInputType: TextInputType.number,
                hintText: 'Contoh: 170',

                textEditingController: controller.tinggiBadan,
                validator: controller.validateTinggiBadan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
