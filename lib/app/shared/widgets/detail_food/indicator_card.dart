import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../theme/font.dart';

class IndicatorCard extends StatelessWidget {
  final num totalCalories;
  final num totalProtein;
  const IndicatorCard({
    super.key,
    this.totalCalories = 1,
    this.totalProtein = 1,
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
                    text: "$totalCalories",
                    style: subTitle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: ' kcal ',
                        style: subTitle.copyWith(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
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
                    text: "$totalProtein",
                    style: subTitle.copyWith(
                      color: mainPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: ' gr ',
                        style: subTitle.copyWith(
                          color: mainPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
