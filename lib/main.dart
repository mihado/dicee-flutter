import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(child: DicePage()),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int randomDiceNumber() => Random().nextInt(6) + 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNum = randomDiceNumber();
      rightDiceNum = randomDiceNumber();
    });
  }

  int leftDiceNum = 1;
  int rightDiceNum = 1;

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () => changeDiceFace(),
                      child: Image.asset('images/dice$leftDiceNum.png')))),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () {
                        changeDiceFace();
                      },
                      child: Image.asset('images/dice$rightDiceNum.png'))))
        ],
      ),
    );
  }
}
