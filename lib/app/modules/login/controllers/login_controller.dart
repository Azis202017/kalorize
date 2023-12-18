import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
 TextEditingController emailEditingController = TextEditingController();
 TextEditingController passwordEditingController = TextEditingController();
 bool isObsecureText = true;
 String? emailValidate(String? value) {
  if(value!.isEmpty) {
    return "Email harus diisi terlebih dahulu";
  }else if(!value.contains("@")){
    return "Tambahakn @ di email mu supaya valid";
  }
  return null;
 }
 String? passwordValidate(String? value) {
  if(value!.isEmpty) {
    return "Password harus diisi terlebih dahulu";
  }
  return null;
 }
 void showPassword() async{
  isObsecureText = !isObsecureText;
  update();
 }
}
