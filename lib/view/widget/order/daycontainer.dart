import 'package:flutter/material.dart';
import 'package:serfast0_1/controller/order_controller.dart';

class Daycontainer extends StatelessWidget {
  final OrderController controller;
  final int index;
  final BuildContext context;
  final int weekDay;
  final int month;
  final int day;
  const Daycontainer(
      {super.key,
      required this.index,
      required this.context,
      required this.weekDay,
      required this.month,
      required this.day,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: controller.selectedDayCard == index
              ? Border.all(color: Colors.greenAccent, width: 2)
              : null,
          color: Theme.of(context).colorScheme.surface),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(controller.daysInWeek[weekDay - 1],
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          Text(controller.monthsInYear[month - 1],
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          Text(day.toString(), style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
