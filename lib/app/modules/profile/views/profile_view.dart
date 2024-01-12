import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalorize/app/shared/theme/color.dart';
import 'package:kalorize/app/shared/widgets/profile.dart';
import 'package:kalorize/app/shared/widgets/tile_profile.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 72,
                ),
                const ProfileWidget(
                  name: 'Umam Syarief',
                  kodeGym: 'AIS124PE',
                  namaGym: 'Mutiara Gym',
                  
                ),
                const SizedBox(
                  height: 36,
                ),
                 ListTileProfile(
                  icon: 'assets/img/change_profile.png',
                  title: 'Ubah Profile',
                  onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                ),
                 ListTileProfile(
                  icon: 'assets/img/lock.png',
                  title: 'Ganti Password',
                  onTap: () => Get.toNamed(Routes.PASSWORD),

                ),
                const ListTileProfile(
                  icon: 'assets/img/magic-star.png',
                  title: 'Ketentuan & Privasi',
                ),
                const ListTileProfile(
                  icon: 'assets/img/book.png',
                  title: 'Beri rating',
                ),
                const ListTileProfile(
                  icon: 'assets/img/message-text.png',
                  title: 'Bantuan',
                ),
                ListTileProfile(
                  icon: 'assets/img/logout.png',
                  title: 'Keluar',
                  color: errorPrimary,
                  backgroundColor: errorSecondary,

                  onTap: controller.confirmLogout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
