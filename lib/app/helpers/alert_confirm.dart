import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/shared/theme/font.dart';

void alertConfirm({
  required String title,
  String? saveTitle,
  String? cancelTitle,

  void Function()? saveButtonTap,
  void Function()? cancelButtonTap,
}) {
  Get.defaultDialog(
    radius: 20,
    title: '',
    contentPadding: EdgeInsets.zero,
    titlePadding: const EdgeInsets.only(
      top: 0,
    ),
    content: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
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
              onPressed: saveButtonTap,
              child:  Text(
                saveTitle ?? "Simpan",
              ),
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
              child:  Text(cancelTitle ?? "Batal"),
            ),
          )
        ],
      ),
    ),
  );
}
