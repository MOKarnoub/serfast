import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  final BuildContext context;
  const AddIcon({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.surface),
      child: const Center(
        child: Icon(Icons.add, size: 31),
      ),
    );
  }
}
