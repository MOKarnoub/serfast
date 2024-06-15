import 'package:flutter/material.dart';

class TapInDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  const TapInDrawer
  ({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,),
          leading: Icon(
            icon,
            size: 27,),
          onTap: onTap
    );
  }
}