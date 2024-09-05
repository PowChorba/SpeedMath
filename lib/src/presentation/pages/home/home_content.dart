import 'package:flutter/material.dart';
import 'package:speed_math/src/presentation/pages/home/component/number_input.dart';
import 'package:speed_math/src/presentation/pages/home/component/select_input.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('-700', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20, fontWeight: FontWeight.bold),),
            Text('-800', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
              'Max 8', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold)
            )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const SelectInput(),
          const SizedBox(height: 20,),
          const NumberInput()

        ],
      ),
    );
  }
}