import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: const Center(
        child: Text(
          'QuestionareView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
