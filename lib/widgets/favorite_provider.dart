import 'package:e_commerce_app/models/item_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<ItemModel> favorites = [];

  List<ItemModel> get favoritesItems => favorites;

  void addFavorite(ItemModel item) {
    if (!favorites.contains(item)) {
      favorites.add(item);
      notifyListeners();
    }
  }

  void removeFavorite(ItemModel item) {
    if (favorites.contains(item)) {
      favorites.remove(item);
      notifyListeners();
    }
  }

  void clearFavorites() {
    favorites.clear();
    notifyListeners();
  }

  double calculateTotalPrice(List<ItemModel> items) {
    double total = 0.0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }

  bool isFavorite(ItemModel item) {
    return favorites.contains(item);
  }
}
