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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
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
            const Expanded(child: HomeContent())
          ],
        ));
  }
}
