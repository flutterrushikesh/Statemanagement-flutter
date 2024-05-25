import 'package:flutter/material.dart';
import 'package:product_wishlist/models/product_model.dart';

class WishlistController extends ChangeNotifier {
  List<ProductModel> wishlistLlist = [];

  void addToWishlist(ProductModel obj) {
    wishlistLlist.add(obj);
    notifyListeners();
  }
}
