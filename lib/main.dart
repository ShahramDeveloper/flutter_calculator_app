import 'package:calculator_application/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  color: backgroundGreyDark,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  height: 100,
                  color: backgroundGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
