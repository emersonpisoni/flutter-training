import 'package:calculator/calculator_button.component.dart';
import 'package:calculator/color.utils.dart';
import 'package:calculator/result.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CalculatorPanel extends StatelessWidget {
  Function calback;

  CalculatorPanel({this.calback});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: [
        CalculatorButton(
            callback: calback, content: 'AC', color: ColorUtils.grey),
        CalculatorButton(content: '+/-', color: ColorUtils.grey),
        CalculatorButton(
            callback: calback, content: '%', color: ColorUtils.grey),
        CalculatorButton(
            callback: calback,
            content: '/',
            color: ColorUtils.orange,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '7',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '8',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '9',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: 'X',
            color: ColorUtils.orange,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '4',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '5',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '6',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '-',
            color: ColorUtils.orange,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '1',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '2',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '3',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '+',
            color: ColorUtils.orange,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '0',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        Container(),
        CalculatorButton(
            callback: calback,
            content: '.',
            color: ColorUtils.darkGrey,
            fontColor: Colors.white),
        CalculatorButton(
            callback: calback,
            content: '=',
            color: ColorUtils.orange,
            fontColor: Colors.white),
      ],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> result = [0.0, 0.0];
  int resultIndex = 0;
  String displayValue = '0';
  final operators = ['/', 'X', '-', '+', '='];
  String operator = '';
  bool shouldHideNumber = false;

  _calculate() {
    switch (operator) {
      case '+':
        return result[0] + result[1];
        break;
      case '-':
        return result[0] - result[1];
        break;
      case '/':
        return result[0] / result[1];
        break;
      case 'X':
        return result[0] * result[1];
        break;
      default:
    }
  }

  _calback(clickedButton) {
    setState(() {
      if (displayValue == '0' && !operators.contains(clickedButton)) {
        displayValue = clickedButton;
        result[resultIndex] = double.tryParse(displayValue);
      } else if (clickedButton == 'AC') {
        resultIndex = 0;
        result = [0.0, 0.0];
        displayValue = '0';
        result[resultIndex] = double.tryParse(displayValue);
      } else if (operators.contains(clickedButton)) {
        if (resultIndex == 0) {
          resultIndex = 1;
        } else {
          displayValue = _calculate().toString();
          result[0] = double.tryParse(displayValue);
          result[1] = 0.0;
        }
        if (clickedButton == '=') {
          result = [0.0, 0.0];
          resultIndex = 0;
        }
        operator = clickedButton;
        shouldHideNumber = true;
      } else {
        final currentValue = displayValue + clickedButton;
        displayValue = shouldHideNumber ? clickedButton : currentValue;
        result[resultIndex] = double.tryParse(displayValue);
        shouldHideNumber = false;
      }
      if (displayValue.endsWith('.0')) {
        displayValue = displayValue.split('.')[0];
      }
      print(result);
      print(resultIndex);
      print(operator);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Result(result: displayValue),
          Expanded(
            child: CalculatorPanel(
              calback: _calback,
            ),
          ),
        ],
      ),
    );
  }
}
