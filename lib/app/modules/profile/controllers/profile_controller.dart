import 'package:get/get.dart';
import 'package:kalorize/app/helpers/alert_confirm.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;



  void increment() => count.value++;
  void confirmLogout() {
    alertConfirm(
      title: 'Apakah kamu yakin ingin keluar?',
      saveTitle: "Tetep Masuk",
      saveButtonTap: () => Get.back(),
      cancelTitle: 'Keluar',
      cancelButtonTap: logout

    );
  }
  void logout() {

  }
}
