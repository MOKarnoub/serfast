import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppServices extends GetxController{

  late SharedPreferences sharedPreferences ;

  Future<MyAppServices> init() async {

     sharedPreferences = await SharedPreferences.getInstance();
      return this;
  }
}

initialServices() async
{
  await Get.putAsync(()=> MyAppServices().init());
}
