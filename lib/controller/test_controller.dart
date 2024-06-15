// import 'package:get/get.dart';
// import 'package:untitled4/core/class/statusrequest.dart';
// import 'package:untitled4/core/functions/handlingdatacotrolling.dart';
// import 'package:untitled4/data/datasrc/remote/test.dart';

// class TestController extends GetxController 
// {
//   TestController({required this.catID,required this.serviceID,required this.providerID});
//   final int catID;
//   final int providerID;
//   final int serviceID;
//   TestData testData=TestData(Get.find());
//   List listOfProviders=[];
//   late StatusRequest statusRequest;
//     getData()async
//   {
//     statusRequest=StatusRequest.loading;
//     var response = await testData.getData(catID.toString(),serviceID.toString(),providerID.toString());
//     print(response);
//     statusRequest=handlingData(response);
//     if (StatusRequest.success==statusRequest) 
//     {
//       if (response["Status"]=="Success") 
//       {
//         listOfProviders.addAll(response['Providers_Info']);
//         print(listOfProviders[0]);
//       }
//       else
//       {
//         statusRequest == StatusRequest.failure;
//       }
//     }
//     update();
//   }
//   @override
//   void onInit() {
//     super.onInit();
//     getData();
//   } 
// }