import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _input = '';
  String _result = '';

  void _buttonPressed(String text) {
    setState(() {
      if (text == 'C') {
        _input = '';
        _result = '';
      } else if (text == '=') {
        _calculate();
      } else {
        _input += text;
      }
    });
  }

  void _calculate() {
    try {
      // Basic support for +, -, *, /
      if (_input.contains('+')) {
        var parts = _input.split('+');
        _result = (double.parse(parts[0]) + double.parse(parts[1])).toString();
      } else if (_input.contains('-')) {
        var parts = _input.split('-');
        _result = (double.parse(parts[0]) - double.parse(parts[1])).toString();
      } else if (_input.contains('*')) {
        var parts = _input.split('*');
        _result = (double.parse(parts[0]) * double.parse(parts[1])).toString();
      } else if (_input.contains('/')) {
        var parts = _input.split('/');
        _result = (double.parse(parts[0]) / double.parse(parts[1])).toString();
      } else {
        _result = 'Invalid';
      }
    } catch (e) {
      _result = 'Error';
    }
  }

  Widget buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(text),
        child: Text(text, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple Calc')),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_input, style: TextStyle(fontSize: 32)),
                    Text(_result, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Row(children: [buildButton('7'), buildButton('8'), buildButton('9'), buildButton('/')]),
            Row(children: [buildButton('4'), buildButton('5'), buildButton('6'), buildButton('*')]),
            Row(children: [buildButton('1'), buildButton('2'), buildButton('3'), buildButton('-')]),
            Row(children: [buildButton('0'), buildButton('C'), buildButton('='), buildButton('+')]),
          ],
        ),
      ),
    );
  }
}
