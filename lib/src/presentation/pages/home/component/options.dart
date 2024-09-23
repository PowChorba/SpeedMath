import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String text;
  final String selectVal;
  Options({super.key, required this.text, required this.selectVal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: selectVal == text
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.primary,
                width: 4)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: TextStyle(
              color: selectVal == text
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
