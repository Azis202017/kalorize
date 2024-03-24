import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalorize/app/data/model/user_model.dart';
import 'package:kalorize/app/helpers/alert_confirm.dart';
import 'package:kalorize/app/routes/app_pages.dart';
import 'package:kalorize/app/services/users_service.dart';

import '../../../constant/global.dart';

class ProfileController extends GetxController {
  UserModel? user = UserModel();
  XFile? image;
  final count = 0.obs;

  bool isLoading = true;
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void increment() => count.value++;
  void confirmLogout() {
    alertConfirm(
        title: 'Apakah kamu yakin ingin keluar?',
        saveTitle: "Tetep Masuk",
        saveButtonTap: () => Get.back(),
        cancelTitle: 'Keluar',
        cancelButtonTap: logout);
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN);
    storage.remove('token');
  }

  void getUserData() async {
    user = await UserService().fetchUserData();
    isLoading = false;
    update();
  }

  void getFoto() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
    bool isSuccesFotoSave = await UserService().changeFoto(imageFile: image, alias: 'foto');
    isLoading = false;
    if(isSuccesFotoSave) {
      print('success');
    }else {
      print("gagal");
    }
    update();
  }
}
