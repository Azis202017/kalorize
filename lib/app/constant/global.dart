import 'package:get_storage/get_storage.dart';

const apiUrl = "https://kalorize-api.fly.dev/api/v1";
const mlUrl = "https://44cd-202-67-40-210.ngrok-free.app/get-recommendation";
const Map<String, String> headers = {
  "Content-Type": "application/json",
  'Accept': 'application/json',
};
GetStorage storage = GetStorage();
