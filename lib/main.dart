import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'constants.dart';

void main() {
  runApp(CalculatorApplication());
}

class CalculatorApplication extends StatefulWidget {
  const CalculatorApplication({super.key});

  @override
  State<CalculatorApplication> createState() => _CalculatorApplicationState();
}

class _CalculatorApplicationState extends State<CalculatorApplication> {
  var inputUser = '';
  var result = '';

  void buttonPressed(String text) {
    setState(() {
      if (text == '×') {
        inputUser += '*';
      } else if (text == '÷') {
        inputUser += '/';
      } else {
        inputUser += text;
      }
    });
  }

  Widget getRow(
      {required String text1,
      required String text2,
      required String text3,
      required String text4}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: backgroundGreyDark, width: 0),
            ),
            backgroundColor: getBackgroundColor(text1),
          ),
          onPressed: () {
            buttonPressed(text1);
          },
          child: Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: getTextColor(text1),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: backgroundGreyDark, width: 0),
            ),
            backgroundColor: getBackgroundColor(text1),
          ),
          onPressed: () {
            if (text2 == 'ce') {
              setState(() {
                if (inputUser.isNotEmpty)
                  inputUser = inputUser.substring(0, inputUser.length - 1);
              });
            } else {
              buttonPressed(text2);
            }
          },
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: getTextColor(text2),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: backgroundGreyDark, width: 0),
            ),
            backgroundColor: getBackgroundColor(text3),
          ),
          onPressed: () {
            buttonPressed(text3);
          },
          child: Text(
            text3,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: getTextColor(text3),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: backgroundGreyDark, width: 0),
            ),
            backgroundColor: getBackgroundColor(text4),
          ),
          onPressed: () {
            if (text4 == '=') {
              Parser parser = Parser();
              Expression expression = parser.parse(inputUser);
              ContextModel contextModel = ContextModel();
              double eval =
                  expression.evaluate(EvaluationType.REAL, contextModel);
              print(eval);
              setState(() {
                result = eval.toString();
              });
            } else {
              buttonPressed(text4);
            }
          },
          child: Text(
            text4,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: getTextColor(text4),
            ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          inputUser,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: textGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          result,
                          textAlign: TextAlign.end,
                          style: TextStyle(color: textGrey, fontSize: 62),
                        ),
                      )
                    ],
                  ),
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
                      getRow(text1: 'ac', text2: 'ce', text3: '%', text4: '÷'),
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

  bool isOperator(String text) {
    var list = ['ac', 'ce', '%', '÷', '×', '-', '+', '='];
    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOperator(text)) {
      return backgroundGreyDark;
    } else {
      return backgroundGrey;
    }
  }

  Color getTextColor(String text) {
    if (isOperator(text)) {
      return textGreen;
    } else {
      return textGrey;
    }
  }
}
