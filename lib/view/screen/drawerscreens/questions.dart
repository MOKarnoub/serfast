import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/controller/questions_controller.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

import '../../../core/enums/device_type.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionsController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: MyAppBar(title: "Questions")),
        body: InfoWidget(
          builder: (context, deviceInfo) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.deviceType != OurDeviceType.mobile
                  ? deviceInfo.screenWidth * 0.15
                  : 8.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset(
                    "assets/images/logoserfast.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.listQuestions.length,
                    itemBuilder: (context, index) {
                      return GetBuilder<QuestionsController>(
                        builder: (controller) => Column(
                          children: [
                            ListTile(
                              onTap: () {
                                controller.changeShowSubTitle(index);
                              },
                              title: Text(
                                controller.listQuestions[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              leading: const Icon(Icons.question_mark),
                            ),
                            if (controller
                                .listQuestions[index].showSubTitle) ...[
                              Container(
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 40, right: 40),
                                child: Text(
                                  controller.listQuestions[index].subTitle,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              )
                            ]
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
