import 'package:flutter/material.dart';
import 'package:serfast0_1/data/model/provider.dart';

// ignore: must_be_immutable
class CustomProvidercard extends StatelessWidget {
  final void Function() onPressedInfoIcon;
  final void Function() onPressedProviderCard;
  final ProviderModel providerModel;
  const CustomProvidercard({
    super.key,
    required this.onPressedInfoIcon,
    required this.onPressedProviderCard,
    required this.providerModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.grey,
      splashFactory: InkRipple.splashFactory,
      onTap: onPressedProviderCard,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.5),
              )
            ],
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.surface),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    providerModel.providerImage!,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        providerModel.firstName!,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.white),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            providerModel.rate!.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 4.0, left: 8.0, right: 8.0),
                  child: Text(
                    providerModel.services!,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 10),
                  ),
                )
              ],
            ),
            Positioned(
                top: 0.1,
                left: 0.1,
                child: IconButton(
                  onPressed: onPressedInfoIcon,
                  icon: Icon(
                    Icons.info,
                    color: Theme.of(context).primaryColorLight,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
