import 'package:flutter/material.dart';
import 'dart:math';

class SelectInput extends StatefulWidget {
  void Function(String?) changeFlap;
  SelectInput({super.key, required this.changeFlap});

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Flap 30', 'Flap 40', 'Flap 15'];

    String dropdownValue = 'Flap 30';

    return DropdownButtonFormField<String>(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: dropdownValue == 'Flap position'
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: dropdownValue == 'Flap Position'
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary)),
        ),
        value: dropdownValue,
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        focusColor: Theme.of(context).colorScheme.onSecondary,
        dropdownColor: Theme.of(context).colorScheme.onPrimary,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
          widget.changeFlap(newValue);
        });
  }
}
