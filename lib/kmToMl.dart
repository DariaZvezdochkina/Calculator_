import 'package:flutter/material.dart';

void main() {
  runApp(KmConverter());
}

class KmConverter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Converter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Converter(),
    );
  }
}

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kilometers to miles Converter"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                child: new Image.asset('image/bltl_maths_level2_example4.png'),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'A kilometer (symbol: km) is a unit of length in the International System of Units (SI). \nA mile (symbol: mi or m) is a unit of length in the imperial and US customary systems of measurement.',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConvertationResult()),
                        );
                      },
                      child: Text(
                        "CONVERT",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class ConvertationResult extends StatefulWidget {
  @override
  _ConvertationResultState createState() => _ConvertationResultState();
}

class _ConvertationResultState extends State<ConvertationResult> {
  String kmResult = "";
  String milesResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Convertation Result"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 400,
                height: 100,
                child: Text(
                  "Metric Conversions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 200,
                alignment: Alignment.center,
                child: Text(
                  "Miles is a unit of measure for length equal to 1760 yards",
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'km',
                  ),
                  onChanged: (String value) {
                    var km = double.parse(value);
                    var result = km * 0.62137;
                    setState(() {
                      kmResult = "Miles: " + result.toString();
                    });
                  },
                ),
                height: 50,
              ),
              Text(kmResult),
              Container(
                width: 200,
                alignment: Alignment.center,
                child: Text(
                  "A kilometer is a unit of length in the metric system, equivalent to one thousand meters",
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'mi',
                  ),
                  onChanged: (String value) {
                    var mi = double.parse(value);
                    var result = mi * 1.60934;
                    setState(() {
                      milesResult = "Kilometers: " + result.toString();
                    });
                  },
                ),
                height: 50,
              ),
              Text(milesResult),
            ],
          ),
        ));
  }
}
