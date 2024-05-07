import 'package:flutter/material.dart';
import 'package:product_details/models/product_model.dart';

class WishListController extends ChangeNotifier {
  List<ProductModel> wishlistobj = [];

  void addToWishList({required ProductModel obj}) {
    wishlistobj.add(obj);
    notifyListeners();
  }
}
