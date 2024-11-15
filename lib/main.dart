import 'package:calculator_application/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  Widget getRow(
      {required String text1,
      required String text2,
      required String text3,
      required String text4}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            text3,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            text4,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: textGrey),
          ),
        ),
      ],
    );
  }

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getRow(text1: 'ac', text2: 'ce', text3: "%", text4: '÷'),
                      getRow(text1: '7', text2: '8', text3: '9', text4: '×'),
                      getRow(text1: '4', text2: '5', text3: '6', text4: '-'),
                      getRow(text1: '1', text2: '2', text3: '3', text4: '+'),
                      getRow(text1: '00', text2: '0', text3: '.', text4: '='),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
