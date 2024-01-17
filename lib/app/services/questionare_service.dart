import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:kalorize/app/constant/global.dart';
import 'package:kalorize/app/services/input/questionare_input.dart';

class QuestionareService {
  Future<bool> fillQuestion({
    required QuestionareInput questionareInput,
  }) async {
    Map<String, dynamic> body = {
      'idUser': questionareInput.idUser,
      'umur': questionareInput.umur,
      'beratBadan': questionareInput.beratBadan,
      'tinggiBadan': questionareInput.tinggiBadan,
      'jenisKelamin': questionareInput.jenisKelamin,
      'frekuensiGym': questionareInput.frekuensiGym,
      'targetKalori': questionareInput.targetKalori,
    };
    final response = await put(
      Uri.parse('$apiUrl/questionnaire'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${GetStorage().read('token')}',
      },
      body: jsonEncode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
