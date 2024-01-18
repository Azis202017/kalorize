import 'package:get_storage/get_storage.dart';

const apiUrl = "https://kalorize-api.fly.dev/api/v1";
const mlUrl = "https://kalorize-ghleyl575q-uc.a.run.app/get-recommendation";
const mlUrlTF = "https://kalorize-ml-idn-tf-ghleyl575q-uc.a.run.app/get-recommendation";
const Map<String, String> headers = {
  "Content-Type": "application/json",
  'Accept': 'application/json',
};
GetStorage storage = GetStorage();
