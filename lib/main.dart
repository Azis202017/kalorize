import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/theme/theme.dart';

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,


  ]);
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      GetMaterialApp(
        
        title: "Kalorize",
        initialRoute: AppPages.INITIAL,
        theme: themeData,
        getPages: AppPages.routes,
        
      ),
    ),
  );
}