import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/locationdata.dart';
import 'package:serfast0_1/data/datasrc/remote/orderdata.dart';
import 'package:serfast0_1/data/datasrc/remote/providerworkdaysdata.dart';
import 'package:serfast0_1/data/datasrc/remote/providerworkhoursdata.dart';
import 'package:serfast0_1/data/model/date_card.dart';
import 'package:serfast0_1/data/model/hours_card.dart';
import 'package:serfast0_1/data/model/locationviewmodel.dart';
import 'package:serfast0_1/data/model/order.dart';
import 'package:serfast0_1/view/screen/thx_for_order.dart';

class OrderController extends GetxController {
  late StatusRequest statusRequest;
  ProviderWorkDaysData providerWorkDaysData = ProviderWorkDaysData(Get.find());
  AddLocationData addLocationData = AddLocationData(Get.find());
  OrderData orderData = OrderData(Get.find());
  ProviderWorkHoursData providerWorkHoursData =
      ProviderWorkHoursData(Get.find());
  late List listofproviderworkdays = [];
  List<LocationViewModel> locations = [];
  late Map<String, List<int>> listHoursMap = {};
  late Map<String, dynamic> responseData = {};
  final int catID;
  final int serviceID;
  final int providerID;
  DateTime? hisDate;
  bool showHisDate = false;
  bool showHisHour = false;
  int selectedDayCard = 0; // for Map of hour have just 7 elements [0 - 6]
  int selectedHourCard = 100; // random value out of range

  OrderController(
      {required this.providerID, required this.serviceID, required this.catID});
  List<int> howMuchDayProviderHas = [];
  MyAppServices myAppServices = Get.find();
  List<DateCard> listDateCard = [
    for (int index = 0; index <= 7; index++)
      DateCard(
          dayNumber: DateTime.now().add(Duration(days: index)).day,
          monthNumber: DateTime.now().add(Duration(days: index)).month,
          weekDayNumber: DateTime.now().add(Duration(days: index)).weekday),
  ];
  getDataDays() async {
    statusRequest = StatusRequest.loading;
    var response = await providerWorkDaysData.getData(
        catID.toString(), serviceID.toString(), providerID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        listofproviderworkdays.addAll(response['listOfProviderWorkDays']);
        for (var element in response['listOfProviderWorkDays']) {
          if (element is int) {
            howMuchDayProviderHas.add(element);
          }
        }
        howMuchDayProviderHas = ayshe(howMuchDayProviderHas);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  getDataHours() async {
    statusRequest = StatusRequest.loading;
    var response = await providerWorkHoursData.getData(
        catID.toString(), serviceID.toString(), providerID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        responseData = response['listOfProviderWorkHours'];
        responseData.forEach((key, values) {
          if (listHoursMap.containsKey(key)) {
            listHoursMap[key]!.addAll(values);
          } else {
            listHoursMap[key] = List.from(values);
          }
        });
        listHoursMap = ayshe1(listHoursMap);
      } else {
        statusRequest == StatusRequest.failure;
      }
    }
    update();
  }

  getLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addLocationData.getData(
      myAppServices.sharedPreferences.getInt("ID").toString(),
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        List data = response['data'];
        locations.addAll(data.map((e) => LocationViewModel.fromJson(e)));
      } else if (response["Status"] == "Failed") {
        statusRequest == StatusRequest.failure;
        update();
      }
    }
    update();
  }

  final daysInWeek = [
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];
  final monthsInYear = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر'
  ];

  // here should I give Provider Id to data Base then I get the Provider Class
  int? selectedLocation = 0;
  void updateSelectedLocation(int? item) {
    selectedLocation = item;
    update();
  }

  void updateHisDate(DateTime hisDate) {
    this.hisDate = hisDate;
    showHisDate = true;
    update();
  }

  void updateShowHisDate(bool value) {
    showHisDate = value;
    update();
  }

  void updateSelectedDayCard(int day) {
    if (selectedDayCard == day) {
      selectedDayCard = 100; // to unSelect
    } else {
      selectedDayCard = day;
    }
    update();
  }

  void updateSelectedHourCard(int hour) {
    if (selectedHourCard == hour) {
      selectedHourCard = 100; // to unSelect
    } else {
      selectedHourCard = hour;
    }
    String time = "${(listHoursMap[selectedDayCard.toString()]![hour])}";
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();
    String date =
        DateTime.now().month < 10 ? "$year-0$month-$day" : "$year-$month-$day";

    int hours = int.parse(time);

    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.add(Duration(
      days: selectedDayCard,
      hours: hours,
    ));

    print("${dateTime.toString()}");

    print(locations[selectedLocation!].locId);

    // print(DateTime.now());
    update();
  }

  sendOrder() async {
    String time =
        "${(listHoursMap[selectedDayCard.toString()]![selectedHourCard])}";
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();
    String date =
        DateTime.now().month < 10 ? "$year-0$month-$day" : "$year-$month-$day";

    int hours = int.parse(time);

    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.add(Duration(
      days: selectedDayCard,
      hours: hours,
    ));
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.getData(
      catID.toString(),
      catID.toString(),
      serviceID.toString(),
      providerID.toString(),
      dateTime.toString(),
      myAppServices.sharedPreferences.getInt("ID").toString(),
      locations[selectedLocation!].locId.toString(),
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Sucsess") {
        Get.offAll(() => const ThxForOrder());
      } else if (response["Status"] == "Failed") {
        statusRequest == StatusRequest.failure;
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    getDataDays();
    getDataHours();
    getLocation();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Map<String, List<int>> ayshe1(Map<String, List<int>> originalMap) {
    final today = DateTime.now().weekday;
    final modifiedMap = <String, List<int>>{};

    originalMap.forEach((key, value) {
      final modifiedKey = (int.parse(key) - (today + 1)).toString();
      if (int.parse(modifiedKey) < 0) {
        modifiedMap[(int.parse(modifiedKey) + 7).toString()] =
            List<int>.from(value); // Create a copy of the list
      } else {
        modifiedMap[modifiedKey] =
            List<int>.from(value); // Create a copy of the list
      }
    });

    return modifiedMap;
  }

  List<int> ayshe(List<int> listCome) {
    List<int> changeList = [];
    int today = DateTime.now().weekday;
    late int theFirstNumber;
    if (today == 7) {
      theFirstNumber = 0;
    } else if (today == 1) {
      theFirstNumber = 1;
    } else if (today == 2) {
      theFirstNumber = 2;
    } else if (today == 3) {
      theFirstNumber = 3;
    } else if (today == 4) {
      theFirstNumber = 4;
    } else if (today == 5) {
      theFirstNumber = 5;
    } else if (today == 6) {
      theFirstNumber = 6;
    }
    for (int index = 0; index < listCome.length; index++) {
      changeList.add((listCome[index] - theFirstNumber));
    }
    for (var i = 0; i < changeList.length; i++) {
      if (changeList[i] < 0) {
        changeList[i] = changeList[i] + 7;
      }
    }
    return changeList;
  }

  // ---------------------------- The Order Code Here -------------------------------
  late Order order = Order(
      date: listDateCard[selectedDayCard],
      // hour: listHours[selectedHourCard],
      hour: HoursCard(amOrPm: 'Pm', hour: 11),
      userId: myAppServices.sharedPreferences.getInt("ID"),
      idProvider: providerID);
}
