import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/theme/font.dart';
import 'package:kalorize/app/shared/widgets/full_size_button.dart';

import '../../../shared/widgets/questionare/general_questionare.dart';
import '../../../shared/widgets/questionare/gym_frequency.dart';
import '../controllers/questionare_controller.dart';

class QuestionareView extends GetView<QuestionareController> {
  const QuestionareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionareController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: PageView(
            controller: controller.pageController,
            onPageChanged: (int index) {
              controller.currentIndex = index;
              controller.update();
            },
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 23,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jawablah pertanyaan untuk tau lebih banyak tentangmu',
                        style: display,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      GeneralQuestionare(
                        controllerBeratBadan:
                            controller.beratBadanEdtController,
                        controllerTinggiBadan:
                            controller.tinggiBadanEdtController,
                        controllerUmur: controller.umurEdtController,
                        onFemaleSelected: controller.onFemaleSelected,
                        onMaleSelected: controller.onMaleSelected,
                        isFemaleSelected: controller.isFemaleSelected,
                        isMaleSelected: controller.isMaleSelected,
                        validateBeratBadan: controller.validateBeratBadan,
                        validateTinggiBadan: controller.validateBeratBadan,
                        validateUmur: controller.validateUmur,
                        onChangeBeratBadan: controller.onChangeBeratBadan,
                        onChangeTinggiBadan: controller.onChangeTinggiBadan,
                        onChangeUmur: controller.onChangeUmur,
                        focusUmur: controller.focusNodeUmur,
                        focusBeratBadan: controller.focusNodeBeratBadan,
                        focusTinggiBadan: controller.focusNodeTinggiBadan,
                        onUmurSubmitted: controller.onSubmittedUmur,
                        onBeratBadanSubmitted: controller.onSubmittedBeratBadan,
                        onTap: controller.activeButton()
                            ? controller.nextPage
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 23,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: controller.previousPage,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                            ),
                            Text(
                              'Kembali',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Jawablah pertanyaan untuk tau lebih banyak tentangmu',
                        style: display,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Text(
                        'Seberapa sering kamu nge gym',
                        style: subTitle,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      GymFrequensy(
                        index: 0,
                        title: "6-7 hari seminggu",
                        isSelected: controller.currentFrequencyGym == 0,
                        onPressed: controller.gymFrequencyExtreme,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GymFrequensy(
                        index: 1,
                        title: "4-5 hari seminggu",
                        isSelected: controller.currentFrequencyGym == 1,
                        onPressed: controller.gymFrequencyHard,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GymFrequensy(
                        index: 2,
                        title: "2-3 hari seminggu",
                        isSelected: controller.currentFrequencyGym == 2,
                        onPressed: controller.gymFrequencyMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GymFrequensy(
                        index: 3,
                        title: "1 hari seminggu",
                        isSelected: controller.currentFrequencyGym == 3,
                        onPressed: controller.gymFrequencyEasy,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                        title: 'Lanjutkan',
                        height: 44,
                        onPressed: controller.currentFrequencyGym != -1
                            ? controller.nextPage
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
              RefreshIndicator(
                onRefresh: () async => controller.getUserData(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 23,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: controller.previousPage,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                              ),
                              Text(
                                'Kembali',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Jawablah pertanyaan untuk tau lebih banyak tentangmu',
                          style: display,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          'Pilih targetmu',
                          style: subTitle,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        GymFrequensy(
                          index: 0,
                          title: "Mengurangi berat badan",
                          isSelected: controller.currentTarget == 0,
                          onPressed: controller.targetReduceWeight,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GymFrequensy(
                          index: 1,
                          title: "Meningkatkan masa otot",
                          isSelected: controller.currentTarget == 1,
                          onPressed: controller.targetIncreaseMuscle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GymFrequensy(
                          index: 2,
                          title: "Menjaga Berat Badan",
                          isSelected: controller.currentTarget == 2,
                          onPressed: controller.targetBeHealthy,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PrimaryButton(
                          title: 'Simpan',
                          height: 44,
                          onPressed: controller.activeButtonSave()
                              ?controller.saveQuestionare
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
