import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final List<String> imageList = [
    'assets/img/onboarding1.png',
    'assets/img/onboarding2.png',
    'assets/img/onboarding3.png',
  ];

  String title = "";
  String subtitle = "";
  int currentPage = 0;

  @override
  void onReady() {
    checkOnboardingStatus();
    super.onReady();
  }

  Future<void> checkOnboardingStatus() async {
    final box = GetStorage();

    bool onboardingCompleted = box.read('onboarding_completed') ?? false;

    if (onboardingCompleted) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void updateContent(int index) {
    currentPage = index;

    if (index == 0) {
      title = "Bantu atur diet";
      subtitle = "Solusi terbaik agar kamu tidak bingung dalam mengatur diet";
      update();
    } else if (index == 1) {
      title = "Sesuaikan dengan Tujuan";
      subtitle = "Sesuaikan dengan body goals yang kamu inginkan";
      update();
    } else if (index == 2) {
      title = "Pilih Menu Makanan";
      subtitle =
          "Sesuaikan menu makanan yang sesuai dengan kalori dan protein tubuh";
      update();
    }
  }

  String getTitle() {
    return title;
  }

  String getSubtitle() {
    return subtitle;
  }

  void goToNextPage() {
    int nextPage = currentPage + 1;
    if (nextPage < imageList.length) {
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      update();
    } else {
      final box = GetStorage();
      box.write('onboarding_completed', true);

      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void skipPage() {
    final box = GetStorage();
    box.write('onboarding_completed', true);

    Get.offAllNamed(Routes.LOGIN);
  }

  void onChangePage(int index) {
    updateContent(index);
  }
}
