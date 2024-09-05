import 'package:flutter/material.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({super.key});

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Flap position', 'Flap 30', 'Flap 32', 'Flap 33'];
    
    String dropdownValue = 'Flap position';

    return SizedBox(
            width: double.infinity,
            child: DropdownButton<String>(value: dropdownValue,style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),borderRadius: const BorderRadius.all(Radius.circular(20)), focusColor: Theme.of(context).colorScheme.onSecondary ,dropdownColor: Theme.of(context).colorScheme.onPrimary,items: list.map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(value: value, child: Text(value,));
            }).toList(), onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          print(dropdownValue);
        });
      }),
          );
  }
}