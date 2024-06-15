import 'package:flutter/material.dart';
import 'package:serfast0_1/data/model/categoryservices.dart';

class MyServices extends StatelessWidget {
  final void Function() onPressedShowAll;
  final CategoryServicesModel categoryServicesModel;
  const MyServices({
    super.key,
    required this.onPressedShowAll,
    required this.categoryServicesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryServicesModel.serviceName!,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        ),
        TextButton(
          onPressed: onPressedShowAll,
          child: Text(
            "عرض الكل",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Theme.of(context).primaryColorLight),
          ),
        ),
      ],
    );
  }
}
