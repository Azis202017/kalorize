import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/routes/app_pages.dart';

import '../../../helpers/date_time_format.dart';
import '../../../shared/widgets/home/header_profile.dart';
import '../../../shared/widgets/home/indicator_card.dart';
import '../../../shared/widgets/home/questionare.dart';
import '../../../shared/widgets/home/title_description.dart';
import '../../../shared/widgets/text_input.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: () async => print("Hello world"),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 23,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderProfile(
                      name: 'Umam',
                      onPressed: () => Get.toNamed(
                        Routes.PROFILE,
                      ),
                    ),
                    TextInput(
                      title: '',
                      textEditingController:controller.dateController,
                      readOnly: true,
                      onTap: controller.showDate,
                      // hintText:
                      //     controller.selectedDate == null ? 'Hari ini ${dateFormat(controller.selectedDate ?? DateTime.now())}' : dateFormat(controller.selectedDate ?? DateTime.now()),
                    ),
                    Questionare(
                      onPressed: () => Get.toNamed(
                        Routes.QUESTIONARE,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const IndicatorCard(),
                    const TitleDescription(
                      title: "Sarapan 🥄",
                      subtitle: "Jangan lupa sarapan sebelum jam 9 pagi ya 💪",
                    ),
                    const TitleDescription(
                      title: "Makan Siang 🍴",
                      subtitle:
                          "Tetep berenergi dengan makan di jam 11.00 - 14.00 😊",
                    ),
                    const TitleDescription(
                      title: "Makan Malam 🍽",
                      subtitle: "Wajib makan sebelum jam 20.00 ya!! 🙌",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
