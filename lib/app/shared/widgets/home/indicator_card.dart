import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../theme/font.dart';
import 'chip_notification.dart';

class IndicatorCard extends StatelessWidget {
  final int totalCalories;
  final int currentCalories;
  final int totalProtein;
  final int currentProtein;
  const IndicatorCard({
    super.key,
    this.totalCalories = 1,
    this.currentCalories = 0,
    this.totalProtein = 1,
    this.currentProtein = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 28),
            decoration: BoxDecoration(
              color: neutralForm,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kalori',
                ),
                Text.rich(
                  TextSpan(
                    text: "$currentCalories",
                    style: subTitle.copyWith(
                        color: mainPrimary, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: ' /',
                        style: subTitle.copyWith(
                          color: neutralDisable,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' $totalCalories ',
                        style: subTitle.copyWith(
                          color: neutralSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'kcal ',
                        style: subTitle.copyWith(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ChipNotification(
                  text: currentCalories < totalCalories
                      ? "Belum Cukup"
                      : "Terpenuhi",
                  icon: currentCalories < totalCalories
                      ? Icons.cancel
                      : Icons.check_circle,
                  color: currentCalories < totalCalories
                      ? errorPrimary
                      : successPrimary,
                  backgroundColor: currentCalories < totalCalories
                      ? errorSecondary
                      : successSecondary,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 28),
            decoration: BoxDecoration(
              color: neutralForm,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Protein',
                ),
                Text.rich(
                  TextSpan(
                    text: "$currentProtein",
                    style: subTitle.copyWith(
                        color: mainPrimary, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: ' /',
                        style: subTitle.copyWith(
                          color: neutralDisable,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' $totalProtein ',
                        style: subTitle.copyWith(
                          color: neutralSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'gr ',
                        style: subTitle.copyWith(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ChipNotification(
                  text: currentProtein < totalProtein
                      ? "Belum Cukup"
                      : "Terpenuhi",
                  icon: currentProtein < totalProtein
                      ? Icons.cancel
                      : Icons.check_circle,
                  color: currentProtein < totalProtein
                      ? errorPrimary
                      : successPrimary,
                  backgroundColor: currentProtein < totalProtein
                      ? errorSecondary
                      : successSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
