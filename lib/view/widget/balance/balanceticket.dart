import 'package:flutter/material.dart';

class BalanceTicket extends StatelessWidget {
  const BalanceTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  "+ ",
                  style: Theme.of(context).textTheme.bodyLarge,),
                Text(
                  "\$ ",
                  style: Theme.of(context).textTheme.bodyLarge,),
                Text(
                  "40,542.00",
                  style: Theme.of(context).textTheme.bodyLarge,),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Credit",
              style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,)),
          ],
        ),
        Column(
          children: [
            Text(
              "Traello App",
              style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 5,),
            Text(
              "28 - 04 - 16",
              style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
      ],
    );
  }
}