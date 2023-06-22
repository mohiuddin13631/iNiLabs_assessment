import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/getx_loclization/languages.dart';
import 'package:mvvm_getx/res/routes/routes.dart';
import 'package:mvvm_getx/res/theme/my_theme.dart';
import 'package:mvvm_getx/view_models/controller/theme_controller.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  
  ThemeController themeController = Get.put(ThemeController());
  
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('en' ,'US'),
      fallbackLocale: const Locale('en' ,'US'),
      theme: themeController.isLight.value == true? MyTheme.lightTheme(context):MyTheme.DarkTheme(context),
      // themeMode: ThemeMode.system,
      getPages: AppRoutes.appRoutes(),
      // home: Test(),
    ));
  }
}

