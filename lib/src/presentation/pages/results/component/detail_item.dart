import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String value;
  const DetailItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary, fontSize: 14),
        ),
      ],
    );
  }
}
