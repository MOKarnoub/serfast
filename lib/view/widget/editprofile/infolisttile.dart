import 'package:flutter/material.dart';

class InfoListtile extends StatelessWidget {
  final String title;
  final String ftext;
  final String? stext;
  final void Function() onTap;
  const InfoListtile({super.key, required this.title, required this.ftext,  this.stext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
          ),
        subtitle: Row(
          children: 
          [
            Text(
              "$ftext $stext",
              style: Theme.of(context).textTheme.bodySmall,
              )
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: onTap, 
    );
  }
}