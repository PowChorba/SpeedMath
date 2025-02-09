import 'package:flutter/material.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/error_dialog.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/number_input.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/options.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/select_input.dart';
import 'package:target_speed_737/src/presentation/pages/results/component/max_flap.dart';

final _formKey = GlobalKey<FormState>();

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
  bool _buttonDisabled = true;

  @override
  void initState() {
    super.initState();

    // Agregar listeners a los controladores para actualizar el estado del botón
    weight.addListener(changedButton);
    runwayHeading.addListener(changedButton);
    windDirection.addListener(changedButton);
    windIntesity.addListener(changedButton);
    gustIntesity.addListener(changedButton);
  }

  void changeFlap(String? value) {
    setState(() {
      flap = value!;
    });
  }

  void changedButton() {
    setState(() {
      if (weight.text.isNotEmpty &&
          runwayHeading.text.isNotEmpty &&
          windDirection.text.isNotEmpty &&
          windIntesity.text.isNotEmpty &&
          gustIntesity.text.isNotEmpty) {
        _buttonDisabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
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
                    validator: (context) {
                      if (int.parse(context!) > 180 && selected == '-700') {
                        return 'The value must be less than 180';
                      } else if (int.parse(context) > 200 &&
                          selected != '-700') {
                        return 'The value must be less than 200';
                      } else if (int.parse(context) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: runwayHeading,
                    labelText: 'Degrees(º)',
                    title: 'Runway Heading',
                    validator: (value) {
                      if (int.parse(value!) > 360) {
                        return 'The value must be less than 360';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: windDirection,
                    labelText: 'Knots (kt)',
                    title: 'Wind Direction',
                    validator: (value) {
                      if (int.parse(value!) > 360) {
                        return 'The value must be less than 360';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: windIntesity,
                    labelText: 'Knots (kt)',
                    title: 'Wind Intensity',
                    validator: (value) {
                      if (int.parse(value!) > 100) {
                        return 'The value must be less than 100';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: gustIntesity,
                    labelText: 'Knots (kt)',
                    title: 'Gust Intensity',
                    validator: (value) {
                      if (int.parse(value!) > 100) {
                        return 'The value must be less than 100';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      } else if (int.parse(value) <
                          int.parse(windIntesity.text)) {
                        return "Gust intenstiy can't be smaller than Wind intesity";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        final validate = _formKey.currentState!.validate();
                        changedButton();
                        // if (int.parse(weight.text) > 180 &&
                        //     selected == '-700') {
                        //   errorDialog(context);
                        // } else {
                        if (validate) {
                          !_buttonDisabled
                              ? Navigator.pushNamed(context, 'results',
                                  arguments: {
                                      'selectedItem': selected,
                                      'flap': flap,
                                      'weight': weight.text,
                                      'runwayHeading': runwayHeading.text,
                                      'windDirection': windDirection.text,
                                      'windIntesity': windIntesity.text,
                                      'gustIntesity': gustIntesity.text,
                                      'maxFlapPlacard':
                                          maxFlapcard[selected]![flap]
                                    })
                              : null;
                        }
                        // }
                        // print(_buttonDisabled);
                        // print(selected);
                        // print(flap);
                        // print(weight.text);
                        // print(vref[selected]![flap]![weight.text]);
                        // print(maxFlapcard[selected]![flap]);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: !_buttonDisabled
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary),
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    // Limpiar los controladores
    weight.dispose();
    runwayHeading.dispose();
    windDirection.dispose();
    windIntesity.dispose();
    gustIntesity.dispose();
    super.dispose();
  }
}
