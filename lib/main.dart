import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/bindings/initialBinding.dart';
import 'package:serfast0_1/core/theme/theme-data/dark_theme.dart';
import 'package:serfast0_1/core/theme/theme-data/light_theme.dart';
import 'package:serfast0_1/routes.dart';
// import 'package:serfast0_1/core/localization/changelocal.dart';
import 'package:serfast0_1/core/localization/translation.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
// import 'package:serfast0_1/test.dart';

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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: getLightThemeData(),
      darkTheme: getDarkThemeData(),
      translations: MyTranslation(),
      initialBinding: InitialBindings(),
      // locale: localController.language,
      // home: TestView(),
      // initialRoute: AppRoute.onboarding,
      // routes: routes,
      getPages: routes,
    );
  }
}
