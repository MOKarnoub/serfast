import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/order_controller.dart';

class ListOfHours extends StatelessWidget {
  const ListOfHours({super.key, required this.controller});
  final OrderController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<OrderController>(builder: (controller) {
        if (controller.selectedDayCard == 100) controller.selectedDayCard = 7;
        // Why when == 100 ? why 100 cuz this package when you select anyDate
        // this always be 100 so that set
        return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                buildContainerForHour(index, context),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: controller
                    .listHoursMap[controller.selectedDayCard.toString()]!
                    .length -
                1);
      }),
    );
  }

  InkWell buildContainerForHour(int index, BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => controller.updateSelectedHourCard(index),
      child: GetBuilder<OrderController>(
        builder: (controller) => Container(
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // backgroundBlendMode: BlendMode.exclusion,
              border: index == controller.selectedHourCard
                  ? Border.all(width: 2, color: Colors.greenAccent)
                  : null,
              color: Theme.of(context).colorScheme.surface),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(controller.listHours[index].amOrPm,
              //     style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 4),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${controller.listHoursMap[controller.selectedDayCard.toString()]?[index + 1].hour} ${controller.listHoursMap[controller.selectedDayCard.toString()]?[index + 1].amOrPm}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 4),
                    Text(
                        "- ${controller.listHoursMap[controller.selectedDayCard.toString()]?[index].hour} ${controller.listHoursMap[controller.selectedDayCard.toString()]?[index].amOrPm}",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
