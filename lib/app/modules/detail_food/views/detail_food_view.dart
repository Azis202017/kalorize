import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/shared/theme/font.dart';
import 'package:kalorize/app/shared/widgets/detail_food/indicator_card.dart';

import '../../../shared/theme/color.dart';
import '../controllers/detail_food_controller.dart';

class DetailFoodView extends GetView<DetailFoodController> {
  const DetailFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailFoodController>(builder: (context) {
      return controller.isLoading
          ? const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Scaffold(
                body: Stack(
                  children: [
                    // Your background content
                    SizedBox(
                      width: double.infinity,
                      height: 360,
                      child: controller.food.foto!.isEmpty
                          ? Image.asset(
                              'assets/img/empty_image.jpg',
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              controller.food.foto ?? "",
                              fit: BoxFit.fill,
                            ),
                    ),
                    // DraggableScrollableSheet
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 68,
                        ),
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                          color: mainPrimary,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: neutralLight,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      minChildSize: 0.6,
                      builder: (
                        BuildContext context,
                        ScrollController scrollController,
                      ) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ), // Set the color you want
                          ),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 40,
                                    child: Image.asset(
                                      'assets/img/line.png',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: Text(
                                    controller.food.nama ?? "",
                                    style: title,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                IndicatorCard(
                                  totalCalories:
                                      controller.detailFood?.kalori ?? 0,
                                  totalProtein:
                                      controller.detailFood?.protein ?? 0,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Bahan',
                                  style: title,
                                ),
                                 const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: neutralForm,
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(
                                    16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: controller
                                                .detailFood?.bahan?.length ??
                                            0,
                                        itemBuilder: (_, index) {
                                          String data = controller
                                                  .detailFood?.bahan?[index] ??
                                              "";
                                          return Text(data);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Cara memasak',
                                  style: title,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: neutralForm,
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(
                                    16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: controller.detailFood
                                                ?.cookingStep?.length ??
                                            0,
                                        itemBuilder: (_, index) {
                                          String data = controller.detailFood
                                                  ?.cookingStep?[index] ??
                                              "";
                                          return Text(data);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
