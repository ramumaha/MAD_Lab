import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "A Simple Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Calculator"
        ),
        centerTitle: true,
      ),
      body: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final inputFieldController = TextEditingController();
  final specialFunctionObj = _SpecialFunctions();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    inputFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: inputFieldController,
          readOnly: true,
        ),
        Expanded(
            child: GridButton(
              onPressed: (dynamic value) {
                value = value.toString();
                // all clear
                if (value == "AC") {
                  inputFieldController.text = "";
                }
                // backspace
                else if (value == "<") {
                  inputFieldController.text = specialFunctionObj.backspace(inputFieldController.text);
                }
                else if (value == "=") {
                  inputFieldController.text = specialFunctionObj.evaluate(inputFieldController.text);
                }
                else {
                  inputFieldController.text += value;
                }
              },
              items: const [
                [
                  GridButtonItem(
                    title: "1",
                  ),
                  GridButtonItem(
                    title: "2",
                  ),
                  GridButtonItem(
                    title: "3",
                  ),
                  GridButtonItem(
                      title: "="
                  ),
                ],
                [
                  GridButtonItem(
                    title: "4",
                  ),
                  GridButtonItem(
                    title: "5",
                  ),
                  GridButtonItem(
                    title: "6",
                  ),
                  GridButtonItem(
                      title: "AC"
                  ),
                ],
                [
                  GridButtonItem(
                    title: "7",
                  ),
                  GridButtonItem(
                    title: "8",
                  ),
                  GridButtonItem(
                    title: "9",
                  ),
                  GridButtonItem(
                      title: "<"
                  ),
                ],
                [
                  GridButtonItem(
                    title: "+",
                  ),
                  GridButtonItem(
                    title: "-",
                  ),
                  GridButtonItem(
                    title: "*",
                  ),
                  GridButtonItem(
                      title: "/"
                  ),
                ],
              ],
            )
        )
      ],
    );
  }
}

class _SpecialFunctions {
  String evaluate(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    String answer = '$eval';
    return answer;
  }

  String backspace(String expression) {
    int n = expression.length;
    if (n >= 1) {
      return expression.substring(
          0,
          n - 1
      );
    }
    else {
      return "";
    }
  }
}
