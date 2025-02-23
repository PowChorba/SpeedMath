import 'package:flutter/material.dart';

class HamburguerContent extends StatelessWidget {
  const HamburguerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'This application is for demonstration purposes only and must not be used for actual flight operations. It is not certified for aviation use and should not be relied upon for navigation, flight planning, or operational decision-making. The developer assumes no responsibility for any misuse of this application. Always follow official aviation regulations and guidelines.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text('Contact: automationflights@gmail.com'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Copyright © 2025 Cumulus Tech SAS. All rights reserved.',
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
