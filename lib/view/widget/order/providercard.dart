import 'package:flutter/material.dart';
import 'package:serfast0_1/data/model/provider.dart';

class ProviderCard extends StatelessWidget {
  final ProviderModel providerModel;
  final Function() onTap;
  final Function() onPressed;
  const ProviderCard({
    super.key,
    required this.providerModel,
    required this.onTap,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: Theme.of(context).colorScheme.surface),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 110,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اسم الخدمة",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        providerModel.services!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اسم العامل:",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "${providerModel.firstName!} ${providerModel.lastName!}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تكلفة الكشف:",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "50000",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onTap,
              // should take ID
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                            providerModel.providerImage!,
                          ),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(
                          onPressed: onPressed, icon: const Icon(Icons.info))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
