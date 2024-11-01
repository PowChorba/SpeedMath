import 'package:flutter/material.dart';
import 'package:speed_math/src/presentation/pages/results/component/detail_item.dart';

class Detail extends StatelessWidget {
  final double hwComponentValue;
  final double gustDiference;
  final bool tailWind; 

  const Detail(
      {super.key, required this.hwComponentValue, required this.gustDiference, required this.tailWind});

  @override
  Widget build(BuildContext context) {
    final double halfHwComponent = hwComponentValue / 2;
    final String gustDiferenceFinal = tailWind ? '-' : gustDiference.toString();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(10)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Theme.of(context).colorScheme.onSecondary,
          collapsedIconColor: Theme.of(context).colorScheme.onSecondary,
          title: Text(
            'Detail',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary, fontSize: 16),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DetailItem(
                    title: 'Total HW Component',
                    value: hwComponentValue.toString(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DetailItem(
                    title: 'CW Component',
                    value: '15',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DetailItem(
                    title: '1/2 HW Component',
                    value: halfHwComponent.toString(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DetailItem(
                    title: 'Gust Diference',
                    value: gustDiferenceFinal,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
