import 'package:flutter/material.dart';
import 'package:serfast0_1/data/model/provider.dart';
import 'package:serfast0_1/view/widget/providerinfo/aboutprovider_container.dart';

class AboutProvider extends StatelessWidget {
  final ProviderModel providerModel;
  const AboutProvider({super.key, required this.providerModel});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AboutProviderContainer(
            title: 'معلومات عن المخدم',
            widget: Column(
              children: [
                Text(
                  providerModel.aboutProvider!,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                )
              ],
            )),
        const SizedBox(height: 23),
        AboutProviderContainer(
            title: 'معلومات الاتصال',
            widget: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.phone_outlined,
                      size: 20,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      providerModel.number!.toString(),
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      providerModel.providerEmail!,
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            )),
        const SizedBox(height: 23),
        AboutProviderContainer(
            title: 'اوقات العمل',
            widget: Column(
              children: List.generate(
                providerModel.workTime![0].dayList!.length,
                (index) => Row(
                  children: [
                    Text(
                      "${providerModel.workTime![0].dayList![index].day} :",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: providerModel
                              .workTime![0].dayList![index].hour!.length,
                          itemBuilder: (context, index1) => Text(
                            providerModel.workTime![0].dayList![index].hour!
                                            .length ==
                                        1 ||
                                    index1 ==
                                        providerModel.workTime![0]
                                                .dayList![index].hour!.length -
                                            1
                                ? providerModel.workTime![0].dayList![index]
                                                .hour![index1] >
                                            0 &&
                                        providerModel.workTime![0]
                                                .dayList![index].hour![index1] <
                                            12
                                    ? " ${providerModel.workTime![0].dayList![index].hour![index1]} AM "
                                    : " ${providerModel.workTime![0].dayList![index].hour![index1] - 12} PM "
                                : providerModel.workTime![0].dayList![index]
                                                .hour![index1] >
                                            0 &&
                                        providerModel.workTime![0]
                                                .dayList![index].hour![index1] <
                                            12
                                    ? " ${providerModel.workTime![0].dayList![index].hour![index1]} AM , "
                                    : " ${providerModel.workTime![0].dayList![index].hour![index1] - 12} PM , ",
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        const SizedBox(height: 23),
        AboutProviderContainer(
          title: 'الموقع',
          widget: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 20,
              ),
              const SizedBox(width: 7),
              Text(
                providerModel.location!,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
