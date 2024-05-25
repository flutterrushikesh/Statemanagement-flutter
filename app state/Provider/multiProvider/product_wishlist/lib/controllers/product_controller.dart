import 'package:flutter/material.dart';
import 'package:product_wishlist/models/product_model.dart';

class ProductController extends ChangeNotifier {
  List productModelObjList = [];

  void addObj(ProductModel pObj) {
    productModelObjList.add(pObj);
    notifyListeners();
  }

  void addFavorite(int index) {
    productModelObjList[index]!.isFavorite =
        !productModelObjList[index]!.isFavorite;
    notifyListeners();
  }

  void addQuantity(int index) {
    productModelObjList[index]!.prodCount =
        productModelObjList[index]!.prodCount + 1;
    notifyListeners();
  }

  void removeQuantity(int index) {
    productModelObjList[index]!.prodCount =
        productModelObjList[index]!.prodCount - 1;
    notifyListeners();
  }
}
