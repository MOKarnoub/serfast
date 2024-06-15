import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/order_controller.dart';

class ListOfDate extends StatelessWidget {
  final OrderController controller;
  const ListOfDate({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == controller.listDateCard.length - 1) {
              return GetBuilder<OrderController>(
                builder: (controller) => InkWell(
                  onTap: () async {
                    if (!controller.showHisDate) {
                      DateTime? hisDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                        builder: (context, child) {
                          return Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.dark(
                                      primary: Colors.orangeAccent)),
                              child: child!);
                        },
                      );
                      controller.updateSelectedDayCard(
                          index); // update Value for order and border
                      if (hisDate != null) {
                        controller.updateHisDate(hisDate);
                      }
                    } else {
                      controller.updateSelectedDayCard(index);
                    }
                  },
                  child: controller.showHisDate
                      ? buildDateCardContainer(
                          controller: controller,
                          context: context,
                          index: index,
                          weekDay: controller.hisDate!.weekday,
                          month: controller.hisDate!.month,
                          day: controller.hisDate!.day)
                      : buildIconAdd(context),
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  controller.updateSelectedDayCard(index);
                },
                child: GetBuilder<OrderController>(
                  builder: (controller) => buildDateCardContainer(
                      controller: controller,
                      index: index,
                      context: context,
                      weekDay: controller.listDateCard[index].weekDayNumber,
                      month: controller.listDateCard[index].monthNumber,
                      day: controller.listDateCard[index].dayNumber),
                ),
              );
            }
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.listDateCard.length),
    );
  }
}

Container buildIconAdd(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.surface),
    child: const Center(
      child: Icon(Icons.add, size: 31),
    ),
  );
}

Container buildDateCardContainer(
    {required OrderController controller,
    required int index,
    required BuildContext context,
    required int weekDay,
    required int month,
    required int day}) {
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
