import 'package:flutter/material.dart';
import 'package:target_speed_737/src/presentation/pages/results/component/description_item.dart';

class Description extends StatelessWidget {
  final bool tailWind;
  final bool flapPlacard;
  final bool limitedMaxRule;
  const Description(
      {super.key,
      required this.tailWind,
      required this.flapPlacard,
      required this.limitedMaxRule});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(10)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Theme.of(context).colorScheme.onSecondary,
          collapsedIconColor: Theme.of(context).colorScheme.onSecondary,
          title: Text(
            'Description',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary, fontSize: 16),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DescriptionItem(
                      title: 'Limited by tailwind rule', value: tailWind),
                  const SizedBox(
                    height: 10,
                  ),
                  DescriptionItem(
                      title: 'Limited by 15 kt max. rule',
                      value: limitedMaxRule),
                  const SizedBox(
                    height: 10,
                  ),
                  DescriptionItem(
                      title: 'Limited by flap placard speed rule',
                      value: flapPlacard),
                  const SizedBox(
                    height: 10,
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
