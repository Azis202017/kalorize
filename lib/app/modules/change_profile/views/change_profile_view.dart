import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/headers_with_button.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  const ChangeProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithButton(
        
      ),
      body: const Center(
        child: Text(
          'ChangeProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
