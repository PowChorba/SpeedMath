import 'package:flutter/material.dart';
import 'package:speed_math/src/presentation/pages/home/home_page.dart';
import 'package:speed_math/src/themes/dark_mode.dart';

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
      title: 'Flutter Demo',
      theme: darkMode,
      home: HomePage(),
    );
  }
}
