import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalorize/app/services/input/change_profile_input.dart';

import '../constant/global.dart';
import '../data/model/user_model.dart';
import 'package:http/http.dart' as http;

import 'input/change_password_input.dart';

class UserService {
  Future<UserModel?> fetchUserData() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$apiUrl/user'),
        headers: {'Authorization': 'Bearer ${storage.read('token')}'},
      );
      print(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body)['data']);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> changeProfile({
    required ChangeProfileInput changeProfileInput,
  }) async {
    Map<String, dynamic> body = {
      'namaUser': changeProfileInput.name,
      'emailUser': changeProfileInput.email,
      'noTelepon': changeProfileInput.nomorTelepon,
    };
    final response = await put(
      Uri.parse('$apiUrl/edit-user'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${storage.read('token')}',
      },
      body: jsonEncode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> changePassword({
    required ChangePasswordInput changePassword,
  }) async {
    Map<String, dynamic> body = {
      'oldPassword': changePassword.oldPassword,
      'newPassword': changePassword.newPassword,
      'passwordConfirmation': changePassword.confirmPassword,
    };
    final response = await put(
      Uri.parse('$apiUrl/edit-password'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${storage.read('token')}',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> changeFoto({
    String? alias,
    XFile? imageFile,
  }) async {
    GetStorage storage = GetStorage();
    try {
      var url = "$apiUrl/edit-photo";
      final request = http.MultipartRequest('PUT', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer ${storage.read('token')}';
      request.headers['Content-Type'] = 'multipart/form-data';
      final file = await http.MultipartFile.fromPath(
        'file',
        '${imageFile?.path}',
      );
      request.files.add(file);
      request.fields['alias'] = "$alias";

      final response = await request.send();
      // List<int> bytes = await response.stream.toBytes();
      // String responseBody = utf8.decode(bytes);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
