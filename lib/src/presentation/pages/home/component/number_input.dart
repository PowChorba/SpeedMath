import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final String title;
  final String labelText;
  final TextEditingController controller;
  String? Function(String?)? validator;
  NumberInput(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.title,
      required this.validator});

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  bool notEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            validator: widget.validator,
            onChanged: (text) {
              setState(() {
                if (widget.controller.text.isEmpty) {
                  notEmpty = false;
                } else {
                  notEmpty = true;
                }
              });
            },
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.onSecondary,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: !notEmpty
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onPrimary)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: !notEmpty
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onPrimary)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary)),
                hintText: 'Insert number',
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.labelText,
            style: TextStyle(
                fontSize: 12, color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
