import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kalorize/app/constant/global.dart';
import 'package:kalorize/app/services/input/login_input.dart';
import 'package:kalorize/app/services/input/register_input.dart';

class AuthService {
  Future<bool> login(LoginInput loginInput) async {
    try {
      Uri url = Uri.parse('$apiUrl/login');
      Map<String, dynamic> body = {
        "email": loginInput.email,
        "password": loginInput.password,
      };
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        String token = json.decode(response.body)['data']['refreshToken'];
        storage.write('token', token);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> register(RegisterInput registerInput) async {
    try {
      Uri url = Uri.parse('$apiUrl/register');
      Map<String, dynamic> body = {
        "namaLengkap": registerInput.nama,
        "email": registerInput.email,
        "password": registerInput.password,
        "passwordConfirmation": registerInput.passwordConfirmation,
        "gymKode": registerInput.kodeGym,
        "referalCode": registerInput.kodeReferral,
        "role": "user"
      };
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      print(json.decode(response.body)['data']['accessToken']);

      if (response.statusCode == 200) {
        String id = json.decode(response.body)['data']['userId'];
        String token = json.decode(response.body)['data']['accessToken'];
        storage.write('userId', id);
        storage.write('token', token);

        // print("token $token");
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
