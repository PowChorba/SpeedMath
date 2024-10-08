import 'package:flutter/material.dart';
import 'package:speed_math/src/presentation/pages/home/component/options.dart';
import 'package:speed_math/src/presentation/pages/results/component/description.dart';
import 'package:speed_math/src/presentation/pages/results/component/detail.dart';

class ResultsContent extends StatelessWidget {
  final String selectedItem;
  final int? vref;
  final double hwComponentValue;
  final double gustDiference;

  const ResultsContent(
      {super.key,
      required this.selectedItem,
      required this.vref,
      required this.hwComponentValue,
      required this.gustDiference});

  @override
  Widget build(BuildContext context) {
    final bool tailWind = hwComponentValue > 0 ? false : true;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Options(text: '-700', selectVal: selectedItem),
              Options(text: '-800', selectVal: selectedItem),
              Options(text: 'MAX 8', selectVal: selectedItem),
              Options(text: 'MAX 9', selectVal: selectedItem)
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Results',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.onPrimary),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VREF',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '$vref',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(0, 255, 255, 1)),
                borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wind Additive',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 255, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '123',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 255, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(255, 0, 255, 1)),
                borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Target Speed',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 0, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '123',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 0, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Detail(
              hwComponentValue: hwComponentValue, gustDiference: gustDiference),
          const SizedBox(
            height: 50,
          ),
          Description(tailWind: tailWind),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.onPrimary),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Max. Flap Placard', style: TextStyle(fontSize: 16)),
                const SizedBox(
                  height: 5,
                ),
                Text('175',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
