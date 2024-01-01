import 'dart:convert';
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
        "NamaLengkap" : registerInput.nama,
        "Email": registerInput.email,
        "Password": registerInput.password,
        "PasswordConfirmation" : registerInput.passwordConfirmation,
        "kodeGym" : registerInput.kodeGym,
        "kodeReferal" : registerInput.kodeReferral
      };
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
  
}
