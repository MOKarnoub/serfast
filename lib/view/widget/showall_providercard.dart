import 'package:flutter/material.dart';
import 'package:serfast0_1/data/model/provider.dart';

class ShowAllProvidersCard extends StatelessWidget {
  final ProviderModel providerModel;
  final void Function() onPressedIcon;
  const ShowAllProvidersCard({
    super.key,
    required this.onPressedIcon,
    required this.providerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 14),
        width: MediaQuery.of(context).size.width - 16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 2,
                offset: Offset(1, 2),
                color: Colors.black26,
              )
            ]),
        child: Row(
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
                                  image:
                                      AssetImage(providerModel.providerImage!),
                                  fit: BoxFit.fitHeight,
                                )),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "${providerModel.firstName!} ${providerModel.lastName!}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            providerModel.rate.toString(),
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
                      Text(providerModel.services!,
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("999",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  )),
                      Text(
                        "تم",
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
        ));
  }
}
