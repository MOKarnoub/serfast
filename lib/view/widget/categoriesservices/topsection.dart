import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  final String userName;
  const TopSection({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Hi, ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextSpan(
              text: userName,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
          ])),
        ), // Text
        // Padding(
        //   padding: const EdgeInsets.only(
        //     top: 16.0, left: 16.0, right: 16.0, bottom: 2),
        //     child: TextField
        //     (
        //       keyboardType: TextInputType.text,
        //       style: Theme.of(context).textTheme.labelSmall,
        //       decoration: InputDecoration
        //       (
        //         hintText: "عن ماذا تبحث؟",
        //         hintStyle: Theme.of(context).textTheme.labelMedium!
        //         .copyWith(color: Colors.white.withOpacity(0.5),),
        //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
        //         suffixIcon: IconButton(
        //           onPressed: () {},
        //           icon: const Icon(Icons.search)
        //       ),
        //     ),
        //   )
        // ),
      ],
    );
  }
}
