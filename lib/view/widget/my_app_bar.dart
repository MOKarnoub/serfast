import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {super.key, this.leading, required this.title});
  final IconButton? leading;
  final String title;
//ProfileScreen()
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary.withOpacity(0.65),
                Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
                Theme.of(context).colorScheme.surface.withOpacity(0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 0.5, 0.9],
            ),
          ),
        ),
        leading: leading);
  }
}
