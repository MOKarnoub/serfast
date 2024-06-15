import 'package:get/get.dart';
import 'package:serfast0_1/core/services/getxservices.dart';
import 'package:serfast0_1/data/model/date_card.dart';
import 'package:serfast0_1/data/model/hours_card.dart';
import 'package:serfast0_1/data/model/order.dart';

class OrderController extends GetxController {
  int providerId;
  DateTime? hisDate;
  bool showHisDate = false;
  bool showHisHour = false;
  int selectedDayCard = 100; // random value out of range
  int selectedHourCard = 100; // random value out of range
  OrderController({required this.providerId});
  MyAppServices myAppServices = Get.find();
  List<DateCard> listDateCard = [
    for (int index = 0; index <= 5; index++)
      DateCard(
          dayNumber: DateTime.now().add(Duration(days: index)).day,
          monthNumber: DateTime.now().add(Duration(days: index)).month,
          weekDayNumber: DateTime.now().add(Duration(days: index)).weekday),
  ];
  final daysInWeek = [
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد'
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

  // ---------------------------- The Order Code Here -------------------------------
  late Order order = Order(
      date: listDateCard[selectedDayCard],
      hour: listHours[selectedHourCard],
      userId: myAppServices.sharedPreferences.getInt("ID"),
      idProvider: providerId);
}
