import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/ItemsModel.dart';
import 'package:scoped_model/scoped_model.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Expanded(child: _buildList()), _buildButton()],
    );
  }

  Widget _buildList() {
    return ScopedModelDescendant<ItemsModel>(
      builder: (context, child, item) {
        return ListView.builder(
            itemCount: item.length(),
            itemBuilder: (context, i) {
              return _buildListItem(item.get(i));
            });
      },
    );
  }

  Widget _buildListItem(Item item) {
    return ListTile(
      key: Key(item.title),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(
        item.title,
        style: TextStyle(
            color: item.isFavourite
                ? Colors.red
                : Theme.of(context).textTheme.subhead.color,
            fontWeight: item.isFavourite ? FontWeight.bold : FontWeight.normal),
      ),
      onTap: () {
        _onListItemClick(item);
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

  void _onListItemClick(Item item) {
    final itemsModel = ScopedModel.of<ItemsModel>(context);

    if (item.isFavourite) {
      itemsModel.removeFromFavourites(item.title);
    } else {
      itemsModel.addToFavourites(item.title);
    }
  }

  void _onButtonClick() {
    final itemsModel = ScopedModel.of<ItemsModel>(context);
    itemsModel.add("Item${itemsModel.length()}");
  }
}
