import 'package:flutter/material.dart';
import '../presentation/views/home/home_view.dart';

class FavoritesProvider extends ChangeNotifier {
  // Private list to store favorite items
  final List<ProductModel> _favoriteItems = [];

  // Getter to access favorite items (read-only)
  List<ProductModel> get favoriteItems => List.unmodifiable(_favoriteItems);

  // Check if a product is in favorites
  bool isFavorite(int productId) {
    return _favoriteItems.any((item) => item.id == productId);
  }

  // Toggle favorite status (add if not exists, remove if exists)
  void toggleFavorite(ProductModel product) {
    final index = _favoriteItems.indexWhere((item) => item.id == product.id);

    if (index >= 0) {
      // Product exists in favorites, remove it
      _favoriteItems.removeAt(index);
    } else {
      // Product doesn't exist, add it to favorites
      _favoriteItems.add(product);
    }

    // Notify all listeners to rebuild UI
    notifyListeners();
  }

  // Add a product to favorites
  void addFavorite(ProductModel product) {
    if (!isFavorite(product.id)) {
      _favoriteItems.add(product);
      notifyListeners();
    }
  }

  // Remove a product from favorites by product ID
  void removeFavorite(int productId) {
    _favoriteItems.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  // Clear all favorites
  void clearFavorites() {
    _favoriteItems.clear();
    notifyListeners();
  }

  // Get total number of favorite items
  int get favoriteCount => _favoriteItems.length;

  // Check if favorites list is empty
  bool get isEmpty => _favoriteItems.isEmpty;

  // Check if favorites list has items
  bool get isNotEmpty => _favoriteItems.isNotEmpty;
}