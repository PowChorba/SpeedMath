import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  const NumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Runway Heading', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 16, fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
            label: Text('Insert number', style: TextStyle(color: Theme.of(context).colorScheme.primary))
          ), 
        )
      ],
    );
  }
}