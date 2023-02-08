import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello basar, Welcome to everest",
            style: TextStyle(fontSize: 20.0)),
      ),
    );
  }
}
