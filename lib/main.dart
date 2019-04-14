import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light, accentColor: Colors.black12),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Items"),
        ),
        body: MainScreen(),
      ),
    );
  }
}
