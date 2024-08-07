// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomProviderCard extends StatelessWidget {
  String providerName;
  String serviceDate;
  double providerRate;
  String providerImage;
  int servicePrice;
  void Function() onPressedIcon;
  CustomProviderCard({
    super.key,
    required this.providerName,
    required this.providerImage,
    required this.providerRate,
    required this.serviceDate,
    required this.servicePrice,
    required this.onPressedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 63,
                        height: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(63),
                            image: DecorationImage(
                              image: AssetImage(providerImage),
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        providerName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '$providerRate',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(serviceDate,
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("$servicePrice",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                          )),
                  Text(
                    "Done",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onPressedIcon,
                  icon: Icon(
                    Icons.help_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
