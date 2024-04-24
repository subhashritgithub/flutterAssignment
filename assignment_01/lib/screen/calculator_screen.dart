import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _selectedArithmetic = 'add';
  double _result = 0;
  int _num1 = 0;
  int _num2 = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedArithmetic = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "subhash mahato",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter 1st number",
                        ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "1st number is require";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _num1 = int.parse(value!);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter 2nd number"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "2nd number is require";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _num2 = int.parse(value!);
                        });
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'add',
                        groupValue: _selectedArithmetic,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        "Add",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'sub',
                        groupValue: _selectedArithmetic,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        "Subtraction",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'mul',
                        groupValue: _selectedArithmetic,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        "Multiply",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'div',
                        groupValue: _selectedArithmetic,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        "Divide",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          switch (_selectedArithmetic) {
                            case "add":
                              setState(() {
                                _result = _num1.toDouble() + _num2.toDouble();
                              });
                            case "sub":
                              setState(() {
                                _result = _num1.toDouble() - _num2.toDouble();
                              });
                            case "mul":
                              setState(() {
                                _result = _num1.toDouble() * _num2.toDouble();
                              });
                            case "div":
                              setState(() {
                                _result = double.parse(
                                    (_num1.toDouble() / _num2.toDouble())
                                        .toStringAsFixed(2));
                              });
                          }
                        }
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Result: ${_result}",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
