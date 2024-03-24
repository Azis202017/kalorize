import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/routes/app_pages.dart';
import 'package:kalorize/app/shared/widgets/home/list_food_card.dart';
import 'package:kalorize/app/shared/widgets/home/list_food_dinner.dart';

import '../../../data/model/recommendation_food.dart';
import '../../../shared/widgets/home/header_profile.dart';
import '../../../shared/widgets/home/indicator_card.dart';
import '../../../shared/widgets/home/list_food_launch.dart';
import '../../../shared/widgets/home/questionare.dart';
import '../../../shared/widgets/home/title_description.dart';
import '../../../shared/widgets/text_input.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Get.put(HomeController(), permanent: true);
    return GetBuilder(
        init: controller,
        builder: (_) {
          return controller.isLoading
              ? const Material(
                  child: Center(child: CircularProgressIndicator()))
              : SafeArea(
                  child: Scaffold(
                    body: RefreshIndicator(
                      onRefresh: () async => controller.getUser(),
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
                                name:
                                    '${controller.user?.firstName} ${controller.user?.lastName}',
                                foto: controller.user?.foto ?? "",
                                onPressed: () => Get.toNamed(
                                  Routes.PROFILE,
                                ),
                              ),
                              TextInput(
                                title: '',
                                textEditingController:
                                    controller.dateController,
                                readOnly: true,
                                onTap: controller.showDate,
                                isShowCalendar: true,
                              ),
                              Questionare(
                                onPressed: () => Get.toNamed(
                                  Routes.QUESTIONARE,
                                  arguments: {
                                    "userId": controller.user?.idUser,
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              IndicatorCard(
                                currentCalories: controller.currentCalories,
                                currentProtein: controller.currentProtein,
                                totalCalories: controller.totalCalories,
                                totalProtein: controller.totalProtein,
                              ),
                              const TitleDescription(
                                title: "Sarapan 🥄",
                                subtitle:
                                    "Jangan lupa sarapan sebelum jam 9 pagi ya 💪",
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListOfFoodBreakfastCard(
                                food: controller.recommendationFood,
                                length: controller.recommendationFood?.breakfast
                                        ?.length ??
                                    0,
                                onPressed: (Breakfast? selectedFood) {
                                  int selectedFoodIndex = controller
                                          .recommendationFood?.breakfast
                                          ?.indexOf(selectedFood!) ??
                                      -1;
                                  if (selectedFoodIndex >= 0) {
                                    if (controller.selectedItems['breakfast'] ==
                                        null) {
                                      controller.selectItem(
                                          'breakfast', selectedFoodIndex);
                                    } else {
                                      controller.cancelSelection('breakfast');
                                    }
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const TitleDescription(
                                title: "Makan Siang 🍴",
                                subtitle:
                                    "Tetep berenergi dengan makan di jam 11.00 - 14.00 😊",
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListOfLaunchFood(
                                food: controller.recommendationFood,
                                length: controller
                                        .recommendationFood?.lunch?.length ??
                                    0,
                                onPressed: (Breakfast? selectedFood) {
                                  int selectedFoodIndex = controller
                                          .recommendationFood?.lunch
                                          ?.indexOf(
                                              selectedFood ?? Breakfast()) ??
                                      -1;

                                  if (selectedFoodIndex >= 0) {
                                    if (controller.selectedItems['lunch'] ==
                                        null) {
                                      // Jika belum ada item yang dipilih, pilih item
                                      controller.selectItem(
                                          'lunch', selectedFoodIndex);
                                    } else {
                                      // Jika sudah ada item yang dipilih, batalkan pemilihan
                                      controller.cancelSelection('lunch');
                                    }
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const TitleDescription(
                                title: "Makan Malam 🍽",
                                subtitle:
                                    "Wajib makan sebelum jam 20.00 ya!! 🙌",
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListOfDinnerFood(
                                food: controller.recommendationFood,
                                length: controller
                                        .recommendationFood?.dinner?.length ??
                                    0,
                                onPressed: (Breakfast? selectedFood) {
                                  int selectedFoodIndex = controller
                                          .recommendationFood?.dinner
                                          ?.indexOf(
                                              selectedFood ?? Breakfast()) ??
                                      -1;

                                  if (selectedFoodIndex >= 0) {
                                    if (controller.selectedItems['dinner'] ==
                                        null) {
                                      controller.selectItem(
                                          'dinner', selectedFoodIndex);
                                    } else {
                                      controller.cancelSelection('dinner');
                                    }
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 12,
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
