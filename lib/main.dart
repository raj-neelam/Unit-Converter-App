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
        body: const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.sizeOf(context).height * 0.5,
        width: double.infinity,
        color: Colors.transparent,
        child: const LengthField(),
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
