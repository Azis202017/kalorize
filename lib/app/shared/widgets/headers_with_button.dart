import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalorize/app/shared/widgets/full_size_button.dart';

import '../theme/color.dart';
import '../theme/font.dart';

class HeaderWithButton extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onTap;
  const HeaderWithButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        right: 16,
        left:16,
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: neutralPrimary,
          ),
        ),
        leadingWidth: 12,
        title: Padding(
          padding: const EdgeInsets.only(
              left: 8), // Sesuaikan nilai ini sesuai kebutuhan
          child: Text(
            'Ubah Profil',
            style: labelLarge.copyWith(
              color: mainSecondary,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          PrimaryButton(
            title: 'Simpan',
            width: 85,
            height: 32,
            textStyle: labelSmall.copyWith(
              color: neutralLight,
            ),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
