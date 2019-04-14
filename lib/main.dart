import 'package:flutter/material.dart';
import 'package:flutter_tutorial/RandomWordsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, accentColor: Colors.green),
      home: RandomWords(),
    );
  }
}
