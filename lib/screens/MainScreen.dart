import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State {
  final _items = <String>[];
  final _saved = <String>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Expanded(child: _buildList()), _buildButton()],
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, i) {
          return _buildListItem(i);
        });
  }

  Widget _buildListItem(int index) {
    final bool isSaved = _saved.contains(_items[index]);

    return ListTile(
      key: Key(_items[index]),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(
        _items[index],
        style: TextStyle(
            color: isSaved
                ? Colors.red
                : Theme.of(context).textTheme.subhead.color,
            fontWeight: isSaved ? FontWeight.bold : FontWeight.normal),
      ),
      onTap: () {
        _onListItemClick(index);
      },
    );
  }

  Widget _buildButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: _onButtonClick,
        color: Colors.green,
        textTheme: ButtonTextTheme.primary,
        child: Text(
          "Add new item".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _onListItemClick(int index) {
    final bool isSaved = _saved.contains(_items[index]);
    setState(() {
      if (isSaved) {
        _saved.remove(_items[index]);
      } else {
        _saved.add(_items[index]);
      }
    });
  }

  void _onButtonClick() {
    setState(() {
      _items.add("Item${_items.length}");
    });
  }
}
