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
    return GetBuilder<ProfileController>(builder: (context) {
      return controller.isLoading
          ? const Material(child: Center(child: CircularProgressIndicator()))
          : SafeArea(
              child: Scaffold(
                body: RefreshIndicator(
                  onRefresh: () async => controller.getUserData(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
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
                          ProfileWidget(
                            name:
                                '${controller.user?.firstName} ${controller.user?.lastName}',
                            kodeGym: controller.user?.kodeGym?.toUpperCase() ?? "",
                            namaGym: '${controller.user?.gym}',
                            onPressed: controller.getFoto,
                            foto: controller.image,
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
              ),
            );
    });
  }
}
