import 'package:flutter/material.dart';
import 'package:serfast0_1/data/model/provider.dart';

class NameAndRateIcon extends StatelessWidget {
  final ProviderModel providerModel;
  const NameAndRateIcon({
    super.key,
    required this.providerModel,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${providerModel.firstName!} ${providerModel.lastName!}",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 18, color: Colors.white.withOpacity(0.85))),
              Row(
                children: [
                  Text(
                    providerModel.rate.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Theme.of(context).primaryColorLight,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
