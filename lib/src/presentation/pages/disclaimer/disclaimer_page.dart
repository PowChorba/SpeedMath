import 'package:flutter/material.dart';

class DisclaimerPage extends StatefulWidget {
  const DisclaimerPage({super.key});

  @override
  State<DisclaimerPage> createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WARNING',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'This product is for informational and educational purposes only.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Your FAA-Approved Airplane FLight Manual or its equivalent is the final authority as to the safe operation of your airplane.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Under no cricumstances should this application be used for flight operations.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'home', (route) => false);
                },
                child: Container(
                  // color: Theme.of(context).colorScheme.onPrimary,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.onPrimary),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Text('I understand',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSecondary)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  'Copyright © 2025 Cumulus Tech SAS. All rights reserved.')
            ],
          ),
        ),
      ),
    );
  }
}
