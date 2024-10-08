import 'package:flutter/material.dart';

class DescriptionItem extends StatelessWidget {
  final String title;
  final bool value;
  const DescriptionItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary, fontSize: 14),
        ),
        Text(
          value ? 'YES' : 'NO',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 16),
        ),
      ],
    );
  }
}
