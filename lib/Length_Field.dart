import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LengthField extends StatefulWidget {
  var title;
  var units;
  var unitsToMili;
  LengthField({
    super.key,
    this.title,
    this.units,
    this.unitsToMili,
  });

  @override
  // ignore: no_logic_in_create_state
  State<LengthField> createState() => _LengthFieldState(
        name: title,
        units: units,
        unitToMili: unitsToMili,
      );
}

class _LengthFieldState extends State<LengthField> {
  var name;
  var units;
  var unitToMili;
  _LengthFieldState({
    this.name,
    this.units,
    this.unitToMili,
  });

  late TextEditingController _controller1;
  late TextEditingController _controller2;

  var _fontSize = 60.0;
  var _fontSize2 = 60.0;

  var index = 0;
  var index2 = 0;

  // TextEditingController _controller1 = TextEditingController();
  // TextEditingController _controller2 = TextEditingController();

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
            child: Center(
              child: Text(name,
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
                        _onTextChanged1();
                        _onTextChanged2();
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _fontSize,
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
                child: SizedBox(
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
                              _onTextChanged1();
                              _onTextChanged2();
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
                            child: SizedBox(
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
                            print(name);
                            setState(() {
                              if (index > 0) {
                                index -= 1;
                              } else {
                                index = units.length - 1;
                              }
                              checkUpdate(_controller1, _controller2, index,
                                  index2, unitToMili);
                              _onTextChanged1();
                              _onTextChanged2();
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
                          _onTextChanged1();
                          _onTextChanged2();
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _fontSize2,
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
                child: SizedBox(
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
                              _onTextChanged1();
                              _onTextChanged2();
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
                            child: SizedBox(
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
                              _onTextChanged1();
                              _onTextChanged2();
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

  void _onTextChanged1() {
    setState(() {
      // Adjust font size based on the length of the text
      if (_controller1.text.length > 18) {
        _fontSize = 15.0; // Decrease font size for longer text
      } else if (_controller1.text.length > 15) {
        _fontSize = 20.0;
      } else if (_controller1.text.length > 11) {
        _fontSize = 25.0; // Decrease font size for longer text
      } else if (_controller1.text.length > 8) {
        _fontSize = 35.0;
      } else if (_controller1.text.length > 4) {
        _fontSize = 50.0;
      } else {
        _fontSize = 60.0; // Default font size
      }
    });
  }

  void _onTextChanged2() {
    setState(() {
      // Adjust font size based on the length of the text
      if (_controller2.text.length > 18) {
        _fontSize2 = 15.0; // Decrease font size for longer text
      } else if (_controller2.text.length > 15) {
        _fontSize2 = 20.0;
      } else if (_controller2.text.length > 11) {
        _fontSize2 = 25.0; // Decrease font size for longer text
      } else if (_controller2.text.length > 8) {
        _fontSize2 = 35.0;
      } else if (_controller2.text.length > 4) {
        _fontSize2 = 50.0;
      } else {
        _fontSize2 = 60.0; // Default font size
      }
    });
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
