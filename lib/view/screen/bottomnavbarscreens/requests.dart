import 'package:flutter/material.dart';
import 'package:serfast0_1/view/screen/temp/billing.dart';
import 'package:serfast0_1/view/widget/custom_requst_providercard.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 14),
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
                child: CustomProviderCard(
                  providerName: "providerName",
                  providerImage: 'assets/images/AC.jpg',
                  providerRate: 5,
                  serviceDate: 'serviceDate',
                  servicePrice: 500,
                  onPressedIcon: () {
                    showDialog(
                        context: context,
                        builder: (context) => const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 100, horizontal: 40),
                              child: Billing(),
                            ));
                  },
                ));
          } else {
            return Container(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 14),
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
                child: CustomProviderCard(
                  providerName: "providerName",
                  providerImage: 'assets/images/AC.jpg',
                  providerRate: 5,
                  serviceDate: 'serviceDate',
                  servicePrice: 500,
                  onPressedIcon: () {
                    showDialog(
                        context: context,
                        builder: (context) => const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 100, horizontal: 40),
                              child: Billing(),
                            ));
                  },
                ));
          }
        },
      ),
    );
  }
}
