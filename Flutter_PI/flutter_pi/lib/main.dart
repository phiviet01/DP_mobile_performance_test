import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double executionTime = 0.0;

  double getPIByGaussLegendre(int rounds) {
    double a0 = 1.0;
    double b0 = 1.0 / sqrt(2.0);
    double t0 = 1.0 / 4.0;
    double p0 = 1.0;
    for (int i = 0; i < rounds; i++) {
      double an = (a0 + b0) / 2;
      double bn = sqrt(a0 * b0);
      double tn = t0 - p0 * pow(a0 - an, 2.0);
      double pn = 2 * p0;
      a0 = an;
      b0 = bn;
      t0 = tn;
      p0 = pn;
    }
    return pow(a0 + b0, 2.0) / (4 * t0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter: PI calculator'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      executionTime = 0.0;
                    });
                    int startTime = DateTime.now().millisecondsSinceEpoch;
                    print('startTime: $startTime');
                    const rounds = 100;
                    for (int i = 0; i < rounds; i++) {
                      getPIByGaussLegendre(10000000);
                    }
                    int endTime = DateTime.now().millisecondsSinceEpoch;
                    print('endTime: $endTime');
                    setState(() {
                      executionTime = (endTime - startTime) / rounds;
                    });
                  },
                  child: Text('Calculate PI'),
                ),
                SizedBox(height: 10),
                Text(
                  'Execution Time:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('$executionTime ms'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
