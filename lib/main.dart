import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/ItemsModel.dart';
import 'package:flutter_tutorial/screens/MainScreen.dart';
import 'package:flutter_tutorial/screens/RandomWordsScreen.dart';
import 'package:flutter_tutorial/screens/wikis/WikiDetailsScreen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, accentColor: Colors.black12),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(title: Text("Flutter tutorial")),
            bottomNavigationBar: _buildTabs(context),
            body: TabBarView(children: [
              _buildMainScreen(),
              _buildRandomWordsScreen(),
              _buildWikisScreen()
            ]),
          )),
    );
  }

  Widget _buildTabs(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).accentColor,
      child: TabBar(tabs: [
        Tab(text: "List", icon: Icon(Icons.home)),
        Tab(text: "Random Words", icon: Icon(Icons.favorite)),
        Tab(text: "Wikis", icon: Icon(Icons.book))
      ]),
    );
  }

  Widget _buildMainScreen() {
    final items = ItemsModel();
    return ScopedModel(model: items, child: MainScreen());
  }

  Widget _buildRandomWordsScreen() {
    return RandomWords();
  }

  Widget _buildWikisScreen() {
    return WikiDetailsScreen();
  }
}
