import 'package:flutter/material.dart';
import 'package:serfast0_1/core/ui_components/info_widget.dart';

import '../../../core/enums/device_type.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InfoWidget(
        builder: (context, deviceInfo) => Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            right: deviceInfo.deviceType != OurDeviceType.mobile
                ? deviceInfo.screenWidth * 0.15
                : 8.0,
            left: deviceInfo.deviceType != OurDeviceType.mobile
                ? deviceInfo.screenWidth * 0.15
                : 8.0,
          ),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  trailing: const Icon(
                    Icons.support_agent_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    "يمكنك الاتصال بفريقنا في اي وقت",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    "لاستفساراتك",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                color: Theme.of(context).colorScheme.onSecondary,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تواصل مع فريقنا عن طريق",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: FractionalOffset.fromOffsetAndSize(
                                          const Offset(20, 40),
                                          const Size(140, 40)),
                                      stops: const [
                                        0.1,
                                        0.3,
                                        0.5,
                                        0.9
                                      ],
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(context).colorScheme.onPrimary,
                                        Theme.of(context).colorScheme.secondary,
                                        Theme.of(context).colorScheme.primary,
                                      ]),
                                ),
                                child: const Icon(Icons.phone),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "مكالمة",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "02148110",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: FractionalOffset.fromOffsetAndSize(
                                          const Offset(20, 40),
                                          const Size(140, 40)),
                                      stops: const [
                                        0.1,
                                        0.3,
                                        0.5,
                                        0.9
                                      ],
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(context).colorScheme.onPrimary,
                                        Theme.of(context).colorScheme.secondary,
                                        Theme.of(context).colorScheme.primary,
                                      ]),
                                ),
                                child: const Icon(Icons.email),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "بريد إلكتروني",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "support@serfast.com",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
