import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
