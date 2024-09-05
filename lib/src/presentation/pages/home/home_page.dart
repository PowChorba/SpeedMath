import 'package:flutter/material.dart';
import 'package:speed_math/src/presentation/pages/home/home_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Text('Calculator',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Colors.white,))
        ],
        centerTitle: true,
      ),
      body: HomeContent()
    );
  }
}