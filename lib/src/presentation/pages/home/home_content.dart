import 'package:flutter/material.dart';
import 'package:speed_math/src/presentation/pages/home/component/number_input.dart';
import 'package:speed_math/src/presentation/pages/home/component/options.dart';
import 'package:speed_math/src/presentation/pages/home/component/select_input.dart';
import 'package:speed_math/src/presentation/pages/results/component/vref.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String selected = '-700';
  String flap = 'Flap 30';
  TextEditingController weight = TextEditingController();
  TextEditingController runwayHeading = TextEditingController();
  TextEditingController windDirection = TextEditingController();
  TextEditingController windIntesity = TextEditingController();
  TextEditingController gustIntesity = TextEditingController();

  void changeFlap(String? value) {
    setState(() {
      flap = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: ListView(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = '-700';
                          });
                        },
                        child: Options(text: '-700', selectVal: selected)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = '-800';
                        });
                      },
                      child: Options(text: '-800', selectVal: selected),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'MAX 8';
                        });
                      },
                      child: Options(text: 'MAX 8', selectVal: selected),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'MAX 9';
                        });
                      },
                      child: Options(text: 'MAX 9', selectVal: selected),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SelectInput(changeFlap: changeFlap),
                const SizedBox(
                  height: 30,
                ),
                NumberInput(
                  controller: weight,
                  labelText: 'K lbs',
                  title: 'Landing Weight',
                ),
                const SizedBox(
                  height: 15,
                ),
                NumberInput(
                  controller: runwayHeading,
                  labelText: 'Degrees(º)',
                  title: 'Runway Heading',
                ),
                const SizedBox(
                  height: 15,
                ),
                NumberInput(
                  controller: windDirection,
                  labelText: 'Knots (kt)',
                  title: 'Wind Direction',
                ),
                const SizedBox(
                  height: 15,
                ),
                NumberInput(
                  controller: windIntesity,
                  labelText: 'Knots (kt)',
                  title: 'Wind Intensity',
                ),
                const SizedBox(
                  height: 15,
                ),
                NumberInput(
                  controller: gustIntesity,
                  labelText: 'Knots (kt)',
                  title: 'Gust Intensity',
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'results', arguments: {
                        'selectedItem': selected,
                        'flap': flap,
                        'weight': weight.text,
                        'runwayHeading': runwayHeading.text,
                        'windDirection': windDirection.text,
                        'windIntesity': windIntesity.text,
                        'gustIntesity': gustIntesity.text,
                      });
                      // print(selected);
                      // print(flap);
                      // print(weight.text);
                      // print(vref[selected]![flap]![weight.text]);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
