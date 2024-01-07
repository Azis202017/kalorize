import 'package:flutter/material.dart';
import 'package:kalorize/app/shared/theme/font.dart';
import 'package:kalorize/app/shared/widgets/full_size_button.dart';

class InternetProblem extends StatelessWidget {
  const InternetProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Internet Bermasalah!!! ',
            textAlign: TextAlign.center,
            style: display,
          ),
          Text(
            'Cek koneksi mu ya...',
            textAlign: TextAlign.center,
            style: display,
          ),
          const SizedBox(
            height: 28,
          ),
          Image.asset(
            'assets/img/pana.png',
            height: 280,
          ),
          const SizedBox(
            height: 28,
          ),
          const PrimaryButton(
            title: 'Coba Lagi',
          ),
          
        ],
      ),
    );
  }
}
