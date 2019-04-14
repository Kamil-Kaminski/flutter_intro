import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/MainScreen.dart';
import 'package:flutter_tutorial/screens/RandomWordsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, accentColor: Colors.black12),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(title: Text("Flutter tutorial")),
            bottomNavigationBar: _buildTabs(context),
            body: TabBarView(children: [MainScreen(), RandomWords()]),
          )),
    );
  }

  Widget _buildTabs(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).accentColor,
      child: TabBar(tabs: [
        Tab(text: "List", icon: Icon(Icons.home)),
        Tab(text: "Random Words", icon: Icon(Icons.favorite))
      ]),
    );
  }
}
