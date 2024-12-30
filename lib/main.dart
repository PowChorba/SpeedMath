import 'package:flutter/material.dart';
import 'package:target_speed_737/src/presentation/pages/disclaimer/disclaimer_page.dart';
import 'package:target_speed_737/src/presentation/pages/home/home_page.dart';
import 'package:target_speed_737/src/presentation/pages/results/results_page.dart';
import 'package:target_speed_737/src/themes/dark_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'target_speed_737',
      theme: darkMode,
      // home: HomePage(),
      initialRoute: 'disclaimer',
      routes: {
        'disclaimer': (BuildContext context) => const DisclaimerPage(),
        'home': (BuildContext context) => const HomePage(),
        'results': (BuildContext context) => const ResultsPage()
      },
    );
  }
}
