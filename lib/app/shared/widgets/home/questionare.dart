import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../theme/font.dart';

class Questionare extends StatelessWidget {
  final void Function()? onPressed;
  const Questionare({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/img/eating.png',
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text(
              'Jangan lupa isi kuisioner sesuai dengan kondisimu hari ini ya!',
              style: subTitle.copyWith(
                color: neutralSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton(
                onPressed: onPressed,
                child: const Text(
                  'Isi Kuesioner',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
