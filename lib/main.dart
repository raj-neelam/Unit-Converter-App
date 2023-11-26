import 'package:flutter/material.dart';

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
          backgroundColor: Colors.grey[600],
          leading: const Icon(Icons.format_underline_outlined, size: 40),
        ),
        backgroundColor: Colors.grey[900],
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
        child: const InputField(),
      ),
      Expanded(
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ]);
  }
}

class InputField extends StatefulWidget {
  const InputField({
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  var index = 0;
  var index2 = 0;
  var units = ["Km", "M", "Cm", "Mm", "In", "Ft", "Ya"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.2,
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                  height: double.infinity,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  color: Colors.green,
                  child: const Center(
                    child: TextField(),
                  )),
              Expanded(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print("first up");
                            setState(() {
                              if (index < units.length - 1) {
                                index += 1;
                              } else {
                                index = 0;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                          ),
                          child: const Icon(
                            Icons.arrow_drop_up,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          width: 300,
                          height: 300,
                          child: Center(
                            child: Text(
                              units[index],
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 30,
                              ),
                            ),
                          ),
                        )),
                        ElevatedButton(
                          onPressed: () {
                            print("first down");
                            setState(() {
                              if (index > 0) {
                                index -= 1;
                              } else {
                                index = units.length - 1;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
          width: double.infinity,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_upward,
                color: Colors.white,
                size: 40,
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.2,
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                  height: double.infinity,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  color: Colors.green,
                  child: const Center(
                    child: TextField(),
                  )),
              Expanded(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print("first up");
                            setState(() {
                              if (index2 < units.length - 1) {
                                index2 += 1;
                              } else {
                                index2 = 0;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                          ),
                          child: const Icon(
                            Icons.arrow_drop_up,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          width: 300,
                          height: 300,
                          child: Center(
                            child: Text(
                              units[index2],
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 30,
                              ),
                            ),
                          ),
                        )),
                        ElevatedButton(
                          onPressed: () {
                            print("first down");
                            setState(() {
                              if (index2 > 0) {
                                index2 -= 1;
                              } else {
                                index2 = units.length - 1;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
