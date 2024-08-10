import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/bindings/initialBinding.dart';
import 'package:serfast0_1/core/theme/theme-data/dark_theme.dart';
import 'package:serfast0_1/core/theme/theme-data/light_theme.dart';
import 'package:serfast0_1/routes.dart';
import 'package:serfast0_1/core/localization/translation.dart';
import 'package:serfast0_1/core/services/getxservices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // LocalController localController = Get.put(LocalController());
    return GetMaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: getLightThemeData(),
      darkTheme: getDarkThemeData(),
      translations: MyTranslation(),
      initialBinding: InitialBindings(),
      // locale: localController.language,
      // home: Test(),
      // initialRoute: AppRoute.onboarding,
      // routes: routes,
      getPages: routes,
    );
  }
}
