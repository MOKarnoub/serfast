import 'package:get/get.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';
import 'package:serfast0_1/core/functions/handlingdatacotrolling.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/datasrc/remote/providerworkdaysdata.dart';
import 'package:serfast0_1/data/model/date_card.dart';
import 'package:serfast0_1/data/model/hours_card.dart';
import 'package:serfast0_1/data/model/order.dart';

class OrderController extends GetxController {
  late StatusRequest statusRequest;
  ProviderWorkDaysData providerWorkDaysData = ProviderWorkDaysData(Get.find());
  late List listofproviderworkdays = [];
  final int catID;
  final int serviceID;
  final int providerID;
  DateTime? hisDate;
  bool showHisDate = false;
  bool showHisHour = false;
  int selectedDayCard = 0; // for Map of hour have just 7 elements [0 - 6]
  int selectedHourCard = 100; // random value out of range
<<<<<<< HEAD
  List<int> howMuchDayProviderHas = [0, 1, 4]; // this get it from dataBase
  // 0  1  2  3  4  5  6   index of day
  // Sa Mn Tu Wn Th Fr St  Days by index
  OrderController({required this.providerId});
=======
  // providerInfoController.listOfProviders
  List<int> howMuchDayProviderHas = [0, 5, 0, 6]; // this get it from dataBase
  // 0  1  2  3  4  5  6   index of day
  // Sa Mn Tu Wn Th Fr St  Days by index
  OrderController({
    required this.catID,
    required this.serviceID,
    required this.providerID,
  });
>>>>>>> 5bf6b2af7bdaf5d2532e019cbd5a9f28068c4e65
  MyAppServices myAppServices = Get.find();
  List<DateCard> listDateCard = [
    for (int index = 0; index <= 7; index++)
      DateCard(
          dayNumber: DateTime.now().add(Duration(days: index)).day,
          monthNumber: DateTime.now().add(Duration(days: index)).month,
          weekDayNumber: DateTime.now().add(Duration(days: index)).weekday),
  ];
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await providerWorkDaysData.getData(
        catID.toString(), serviceID.toString(), providerID.toString());
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["Status"] == "Success") {
        listofproviderworkdays.addAll(response['listOfProviderWorkDays']);
      } else {
        statusRequest == StatusRequest.failure;
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

  List<HoursCard> listHours = [
    for (int index = 8; index <= 11; index++)
      HoursCard(amOrPm: "Am", hour: index),
    HoursCard(amOrPm: "Pm", hour: 12),
    for (int index = 1; index <= 11; index++)
      HoursCard(amOrPm: "Pm", hour: index)
  ];
  Map<String, List<HoursCard>> listHoursMap = {
    '0': [
      HoursCard(amOrPm: "Am", hour: 2),
      HoursCard(amOrPm: "Am", hour: 3),
      HoursCard(amOrPm: "Am", hour: 4),
      HoursCard(amOrPm: "Am", hour: 5)
    ],
    '1': generateHoursCards(),
    '2': [HoursCard(amOrPm: "Am", hour: 2)],
    '3': generateHoursCards(),
    '4': generateHoursCards(),
    '5': generateHoursCards(),
    '6': generateHoursCards(),
    '7': generateHoursCards(), // this for Last Container Add time
  };
  // here should I give Provider Id to data Base then I get the Provider Class
  List<String> listOfLocation = [
    "موكامبو",
    "شارع النيل",
    "فرقان",
    "اشرفية",
    "اعظمية",
    "شهباء",
    "زهراء",
    "ميدان",
  ];
  int? selectedLocation = 0;
  void updateSelectedLocation(int? item) {
    selectedLocation = item;
    update();
  }

  void updateHisDate(DateTime hisDate) {
    this.hisDate = hisDate;
    showHisDate = true;
    print(hisDate);
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
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ---------------------------- The Order Code Here -------------------------------
  late Order order = Order(
      date: listDateCard[selectedDayCard],
      // hour: listHours[selectedHourCard],
      hour: HoursCard(amOrPm: 'Pm', hour: 11),
      userId: myAppServices.sharedPreferences.getInt("ID"),
      idProvider: providerID);
}

List<HoursCard> generateHoursCards() {
  List<HoursCard> hoursCards = [];

  for (int index = 8; index <= 11; index++) {
    hoursCards.add(HoursCard(amOrPm: "Am", hour: index));
  }
  hoursCards.add(HoursCard(amOrPm: "Pm", hour: 12));
  for (int index = 1; index <= 11; index++) {
    hoursCards.add(HoursCard(amOrPm: "Pm", hour: index));
  }

  return hoursCards;
}

List<HoursCard> generateHoursCards() {
  List<HoursCard> hoursCards = [];

  for (int index = 8; index <= 11; index++) {
    hoursCards.add(HoursCard(amOrPm: "Am", hour: index));
  }
  hoursCards.add(HoursCard(amOrPm: "Pm", hour: 12));
  for (int index = 1; index <= 11; index++) {
    hoursCards.add(HoursCard(amOrPm: "Pm", hour: index));
  }

  return hoursCards;
}
