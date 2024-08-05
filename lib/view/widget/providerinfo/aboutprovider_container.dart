import 'package:flutter/material.dart';

class AboutProviderContainer extends StatelessWidget {
  final String title;
  final Widget widget;
  const AboutProviderContainer(
      {super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(17, 39, 59, 1.0),
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1.1,
                blurRadius: 1,
                offset: Offset(1, 1),
              )
            ]),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10),
          widget,
        ]));
  }
}
