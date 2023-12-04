import 'package:flutter/material.dart';
import 'package:unitconv/Length_Field.dart';
import 'package:unitconv/navigator_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("UnitConv",
              style: TextStyle(color: Colors.white, fontSize: 40)),
          backgroundColor: Colors.blueGrey[700],
          leading: const Icon(Icons.format_underline_outlined, size: 40),
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body({
    super.key,
  });

  var Length_units = [
    "KiloMeter",
    "Meter",
    "CentiMeter",
    "MiliMeter",
    "Inch",
    "Feet",
    "Yard"
  ];
  var Length_unitToMili = [1000, 1, 0.01, 0.001, 0.0254, 0.3048, 0.914];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.sizeOf(context).height * 0.5,
        width: double.infinity,
        color: Colors.transparent,
        child: LengthField(
          title: "Length Converter",
          units: Length_units,
          unitsToMili: Length_unitToMili,
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.blueGrey[900],
          child: NavigationField(),
        ),
      ),
    ]);
  }
}

void setValueOfInp(controller, val) {
  val = val.toString();
  var ind = val.length - 1;
  while (true) {
    if (val[val.length - 1] != "0") {
      break;
    } else {
      val = val.substring(0, ind);
      ind -= 1;
    }
  }
  val = val + "0";
  controller.text = val.toString();
}

void checkUpdate(controlerA, controlerB, indexA, indexB, unitToMili) {
  double? val = double.tryParse(controlerA.text);
  val ??= 0;
  var miliVal = unitToMili[indexA] * val;
  var unitVal = (1 / unitToMili[indexB]) * miliVal;
  setValueOfInp(controlerB, unitVal.toStringAsFixed(4));
}
