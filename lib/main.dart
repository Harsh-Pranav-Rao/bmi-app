import 'package:flutter/material.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 0;
  double weight = 60;
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white38),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: 300,
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(width: 0),
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("HEIGHT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white24,
                          fontSize: 12,
                        )),
                    Text(
                      "${height.round()} cm",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Slider(
                        activeColor: Colors.white70,
                        value: height,
                        min: 0,
                        max: 300,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                )),
            Container(
                width: 200,
                height: 144,
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(width: 0),
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Text("WEIGHT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white24,
                          fontSize: 12,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${weight.round()} kg",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Text(' - '),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor: Colors.white12)),
                        SizedBox(width: 20),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Text(' + '),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                 backgroundColor: Colors.white12))
                      ],
                    )
                  ],
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState((){ //Refreshes the whole class you're working with, in this case
                          result = weight / ((height / 100) * (height / 100));
                          print(result);
                        });

                      },
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(30),
                      ))
                ],
              ),
            ),
            Container(
              color: Colors.pinkAccent,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI is ${result.toStringAsFixed(1)}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
