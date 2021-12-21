import 'package:calculator_project/HistoryPage.dart';
import 'package:calculator_project/kmToMl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyCalculator',
      home: Calculate(),
    );
  }
}

class Calculate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Calculator"),
      ),
      body: new CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<CalculatorApp> {
  String fulfilledEquation = "";
  String historyText = "";
  final controller1 =
      TextEditingController(); //for managing text in text fields
  final controller2 = TextEditingController();
  List<String> lastCalculations = [];
  final _formKey = GlobalKey<FormState>();

  SharedPreferences prefs;

  void Addition() async {
    if (_formKey.currentState.validate()) {
      int number1 = int.parse(controller1.text); //convert text to number
      int number2 = int.parse(controller2.text);
      int result = number1 + number2;
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('MMMM dd, yyyy kk:mm').format(now);

      setState(() {
        fulfilledEquation = "$number1 + $number2 = $result";
        historyText =
            "Equation: '$fulfilledEquation' \nTimestamp: $formattedDate";
      });
      prefs = await SharedPreferences.getInstance();
      prefs.setString(DateTime.now().toString(), historyText);
      setState(() {
        lastCalculations.add(historyText);
      });
    }
  }

  void Subtraction() async {
    if (_formKey.currentState.validate()) {
      int number1 = int.parse(controller1.text);
      int number2 = int.parse(controller2.text);
      int result = number1 - number2;
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('MMMM dd, yyyy kk:mm').format(now);

      setState(() {
        fulfilledEquation = "$number1 - $number2 = $result";
        historyText =
            "Equation: '$fulfilledEquation' \nTimestamp: $formattedDate";
      });
      prefs = await SharedPreferences.getInstance();
      prefs.setString(DateTime.now().toString(), historyText);
      setState(() {
        lastCalculations.add(historyText);
      });
    }
  }

  void Multiplication() async {
    if (_formKey.currentState.validate()) {
      int number1 = int.parse(controller1.text);
      int number2 = int.parse(controller2.text);
      int result = number1 * number2;
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('MMMM dd, yyyy kk:mm').format(now);

      setState(() {
        fulfilledEquation = "$number1 * $number2 = $result";
        historyText =
            "Equation: '$fulfilledEquation' \nTimestamp: $formattedDate";
      });
      prefs = await SharedPreferences.getInstance();
      prefs.setString(DateTime.now().toString(), historyText);
      setState(() {
        lastCalculations.add(historyText);
      });
    }
  }

  void Division() async {
    if (_formKey.currentState.validate()) {
      int number1 = int.parse(controller1.text);
      int number2 = int.parse(controller2.text);
      double result = number1 / number2;
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('MMMM dd, yyyy kk:mm').format(now);

      setState(() {
        fulfilledEquation = "$number1 / $number2 = $result";
        historyText =
            "Equation: '$fulfilledEquation' \nTimestamp: $formattedDate";
      });
      prefs = await SharedPreferences.getInstance();
      prefs.setString(DateTime.now().toString(), historyText);
      setState(() {
        lastCalculations.add(historyText);
      });
    }
  }

  int powerMethod(int numberA, int numberB) {
    return pow(numberA, numberB);
  }

  void Power() async {
    if (_formKey.currentState.validate()) {
      int number1 = int.parse(controller1.text);
      int number2 = int.parse(controller2.text);
      int result = powerMethod(number1, number2);
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('MMMM dd, yyyy kk:mm').format(now);

      setState(() {
        fulfilledEquation = "$number1 ^ $number2 = $result";
        historyText =
            "Equation: '$fulfilledEquation' \nTimestamp: $formattedDate";
      });
      prefs = await SharedPreferences.getInstance();
      prefs.setString(DateTime.now().toString(), historyText);
      setState(() {
        lastCalculations.add(historyText);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                            color: Colors.deepPurple,
                            child: Text(
                              "History",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()),
                              );
                            }),
                        RaisedButton(
                            color: Colors.deepPurple,
                            child: Text(
                              "Converter",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KmConverter()),
                              );
                            })
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Please, enter 2 numbers",
                  style: TextStyle(fontSize: 24, color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  fulfilledEquation,
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                            textAlign: TextAlign.right,
                            controller: controller1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color.fromRGBO(204, 204, 225, 1),
                                filled: true),
                            keyboardType: TextInputType.number),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            textAlign: TextAlign.right,
                            controller: controller2,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color.fromRGBO(204, 204, 225, 1),
                                filled: true),
                            keyboardType: TextInputType.number),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        height: 100,
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 3,
                                color: Colors.deepPurple,
                                style: BorderStyle.solid)),
                        onPressed: Addition,
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(width: 80,),
                      MaterialButton(
                        height: 100,
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 3,
                                color: Colors.deepPurple,
                                style: BorderStyle.solid)),
                        onPressed: Subtraction,
                        child: Text('-', style: TextStyle(fontSize: 30)),
                      ),
                    ]),
                Container(child: MaterialButton(
                  height: 100,
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 3,
                          color: Colors.deepPurple,
                          style: BorderStyle.solid)),
                  onPressed: Power,
                  child: Text('^', style: TextStyle(fontSize: 30)),
                ),),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        height: 100,
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 3,
                                color: Colors.deepPurple,
                                style: BorderStyle.solid)),
                        onPressed: Division,
                        child: Text('/', style: TextStyle(fontSize: 30)),
                      ),
                      SizedBox(width: 80,),
                      MaterialButton(
                        height: 100,
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 3,
                                color: Colors.deepPurple,
                                style: BorderStyle.solid)),
                        onPressed: Multiplication,
                        child: Text('*', style: TextStyle(fontSize: 30)),
                      ),
                    ]),
              ],
            )));
  }
}
