import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/order_controller.dart';
import 'package:serfast0_1/controller/providerinfo_controller.dart';
import 'package:serfast0_1/view/widget/order/addicon.dart';
import 'package:serfast0_1/view/widget/order/daycontainer.dart';

class ListOfDate extends StatelessWidget {
  final OrderController controller;
  final ProviderInfoController providerInfoController;
  const ListOfDate(
      {super.key,
      required this.controller,
      required this.providerInfoController});
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
                                      primary: Colors.green)),
                              child: child!);
                        },
                      );
                      controller.updateSelectedDayCard(
                          index); // update Value for order and border
                      controller.updateHisDate(hisDate!);
                    } else {
                      controller.updateSelectedDayCard(index);
                    }
                  },
                  child: controller.showHisDate
                      ? Daycontainer(
                          index: index,
                          context: context,
                          weekDay: controller.hisDate!.weekday,
                          month: controller.hisDate!.month,
                          day: controller.hisDate!.day,
                          controller: controller)
                      : AddIcon(context: context),
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  controller.updateSelectedDayCard(index);
                },
                child: GetBuilder<OrderController>(
                  builder: (controller) => Daycontainer(
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
