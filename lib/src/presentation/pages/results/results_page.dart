import 'package:flutter/material.dart';
import 'package:speed_math/src/presentation/pages/results/component/maths.dart';
import 'package:speed_math/src/presentation/pages/results/component/vref.dart';
import 'package:speed_math/src/presentation/pages/results/results_content.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String selectedItem = arguments['selectedItem'];
    String flapSelect = arguments['flap'];
    String weight = arguments['weight'];
    String runwayHeading = arguments['runwayHeading'];
    String windDirection = arguments['windDirection'];
    String windIntesity = arguments['windIntesity'];
    String gustIntesity = arguments['gustIntesity'];
    double hwComponentValue = hwComponent(double.parse(runwayHeading),
        double.parse(windDirection), double.parse(windIntesity));
    int? vrefValue = vref[selectedItem]![flapSelect]![weight];

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            iconTheme:
                IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            // backgroundColor: Colors.red,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            title: Text(
              'Calculator',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 32,
                  ))
            ],
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            Container(
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: Divider(
                  color: Theme.of(context).colorScheme.primary,
                )),
            Expanded(
                child: ResultsContent(
                    selectedItem: selectedItem,
                    vref: vrefValue,
                    hwComponentValue: hwComponentValue))
          ],
        ));
  }
}
