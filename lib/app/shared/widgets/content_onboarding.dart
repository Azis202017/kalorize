import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/full_size_button.dart';

import '../../modules/onboarding/controllers/onboarding_controller.dart';
import '../theme/color.dart';
import '../theme/font.dart';

class Content extends StatelessWidget {
  final List<String> imageList;
  final int currentPage;
  final String title;
  final String subtitle;
  final void Function()? nextPage;
  final void Function()? skipPage;

  const Content({
    super.key,
    required this.imageList,
    required this.currentPage,
    required this.title,
    required this.subtitle,
    this.nextPage,
    this.skipPage,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: GetBuilder<OnboardingController>(builder: (_) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageList.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: index == currentPage ? 32 : 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        index == currentPage ? 100 : 12,
                      ),
                      color: index == currentPage ? mainPrimary : neutralLine,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  title,
                  style: display,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  subtitle,
                  style: subDisplay,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: FullSizeButton(
                  onPressed: nextPage,
                  title: "Lanjut",
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: skipPage,
                    child: const Text(
                      "Lewati",
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
