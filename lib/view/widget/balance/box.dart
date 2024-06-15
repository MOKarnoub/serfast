import 'package:flutter/material.dart';

class BalanceBox extends StatelessWidget {
  const BalanceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: FractionalOffset.fromOffsetAndSize(
              const Offset(20, 40), const Size(140, 40)
              ),
            stops: const 
            [
              0.1,
              0.3,
              0.5,
              0.9
            ],
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.onPrimary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.onSecondary,
            ]),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 0.5),
            spreadRadius: 1,
            blurRadius: 1,
            color: Colors.black.withOpacity(0.5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Text(
              "Savings",
              style: Theme.of(context).textTheme.titleMedium,),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$ ",
                  style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(
                    color: Colors.orangeAccent,),
                ),
                Text(
                  "40,542.00",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}