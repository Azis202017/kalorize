import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/shared/theme/font.dart';

import '../shared/theme/color.dart';

void alertConfirm({
  void Function()? saveButtonTap,
  void Function()? cancelButtonTap,
}) {
  Get.defaultDialog(
    title: '',
    titlePadding: const EdgeInsets.only(
      top: 0,
    ),
    content: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: neutralLight,
      ),
      height: 170, // Set the desired height here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Apakah anda yakin untuk logout dari akun ini',
              style: labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed:saveButtonTap,
              child: const Text('Simpan'),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: TextButton(
              onPressed: cancelButtonTap,
              child: const Text('Batal'),
            ),
          )
        ],
      ),
    ),
  );
}
