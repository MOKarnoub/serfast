import 'package:flutter/material.dart';
import 'package:serfast0_1/view/widget/balance/balanceticket.dart';
import 'package:serfast0_1/view/widget/balance/box.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MyAppBar(title: "Balance"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: ListView(
            children: [
              const BalanceBox(), // First Box
              const SizedBox(height: 10),
              Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0, bottom: 14),
                      width: MediaQuery.of(context).size.width - 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColorDark,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 2,
                              offset: Offset(1, 2),
                              color: Colors.black26,
                            )
                          ]),
                      child: const Padding(
                          padding: EdgeInsets.all(8.0), child: BalanceTicket()),
                    ),
                  ),
                ],
              ) // for ticket
            ],
          ),
        ),
      ),
    );
  }
}
