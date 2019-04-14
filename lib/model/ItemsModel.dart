import 'package:scoped_model/scoped_model.dart';

class ItemsModel extends Model {
  final _items = <String>[];
  final _favouriteItems = <String>[];

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(String item) {
    _items.remove(item);
    notifyListeners();
  }

  void addToFavourites(String item) {
    _favouriteItems.add(item);
    notifyListeners();
  }

  void removeFromFavourites(String item) {
    _favouriteItems.remove(item);
    notifyListeners();
  }

  bool isFavourite(String item) => _favouriteItems.contains(item);

  Item get(int index) =>
      Item(_items[index], _favouriteItems.contains(_items[index]));

  int length() => _items.length;
}

class Item {
  String title;
  bool isFavourite;

  Item(this.title, this.isFavourite);
}
