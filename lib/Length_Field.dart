import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LengthField extends StatefulWidget {
  const LengthField({
    super.key,
  });

  @override
  State<LengthField> createState() => _LengthFieldState();
}

class _LengthFieldState extends State<LengthField> {
  var index = 0;
  var index2 = 0;
  var units = [
    "KiloMeter",
    "Meter",
    "CentiMeter",
    "MiliMeter",
    "Inch",
    "Feet",
    "Yard"
  ];
  var unitToMili = [1000, 1, 0.01, 0.001, 0.0254, 0.3048, 0.914];

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: "0.00");
    _controller2 = TextEditingController(text: "0.00");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            child: const Center(
              child: Text("Length Converter",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            )),

        // first inp
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.2,
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: MediaQuery.sizeOf(context).width * 0.6,
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      controller: _controller1,
                      onChanged: (value) {
                        double? val = double.tryParse(value);
                        val ??= 0;
                        var miliVal = unitToMili[index] * val;
                        var unitVal = (1 / unitToMili[index2]) * miliVal;
                        setValueOfInp(_controller2, unitVal);
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,3}'))
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                ),
              ),

              // arrow press region
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
                              checkUpdate(_controller1, _controller2, index,
                                  index2, unitToMili);
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
                              checkUpdate(_controller1, _controller2, index,
                                  index2, unitToMili);
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

        // second inp
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.2,
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                  height: double.infinity,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  color: Colors.transparent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: TextField(
                        controller: _controller2,
                        onChanged: (value) {
                          double? val = double.tryParse(value);
                          val ??= 0;
                          var miliVal = unitToMili[index2] * val;
                          var unitVal = (1 / unitToMili[index]) * miliVal;
                          setValueOfInp(_controller1, unitVal);
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,3}'))
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                    ),
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
                              checkUpdate(_controller2, _controller1, index2,
                                  index, unitToMili);
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
                              checkUpdate(_controller2, _controller1, index2,
                                  index, unitToMili);
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

void setValueOfInp(controller, val) {
  controller.text = val.toString();
}

double getValueOfInp(controller) {
  double? val = double.tryParse(controller.text);
  val ??= 0;
  return val;
}

void checkUpdate(controlerA, controlerB, indexA, indexB, unitToMili) {
  var val = getValueOfInp(controlerA);
  var miliVal = unitToMili[indexA] * val;
  var unitVal = (1 / unitToMili[indexB]) * miliVal;
  setValueOfInp(controlerB, unitVal);
}
