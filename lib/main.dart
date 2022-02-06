import 'package:flutter/material.dart';
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

  int leftDiceNum = 1;
  int rightDiceNum = 1;

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          leftDiceNum = randomDiceNumber();
                          rightDiceNum = randomDiceNumber();
                        });
                      },
                      child: Image.asset('images/dice$leftDiceNum.png')))),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          leftDiceNum = randomDiceNumber();
                          rightDiceNum = randomDiceNumber();
                        });
                      },
                      child: Image.asset('images/dice$rightDiceNum.png'))))
        ],
      ),
    );
  }
}
