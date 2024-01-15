import 'dart:convert';

import '../constant/global.dart';
import '../data/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserModel?> fetchUserData() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$apiUrl/user'),
        headers: {'Authorization': 'Bearer ${storage.read('token')}'},
      );
      if(response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body)['data']);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
