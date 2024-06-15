import 'date_card.dart';
import 'hours_card.dart';

class Order {
  int? userId;
  int idProvider;
  DateCard date;
  HoursCard hour;
  Order({required this.date, required this.hour,required this.idProvider,required this.userId});
}