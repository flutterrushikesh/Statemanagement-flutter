import 'package:flutter/material.dart';
import 'package:product_details/models/product_model.dart';

class ProductController extends ChangeNotifier {
  List<ProductModel> productModelObjList = [];

  void addProduct(ProductModel productModelObj) {
    productModelObjList.add(productModelObj);
    notifyListeners();
  }

  void addQuantity(int index) {
    productModelObjList[index].productQuantity =
        productModelObjList[index].productQuantity! + 1;

    notifyListeners();
  }

  void removeQuantity(int index) {
    productModelObjList[index].productQuantity =
        productModelObjList[index].productQuantity! - 1;
    notifyListeners();
  }

  void addToFavorite({required int index}) {
    productModelObjList[index].isFavorite =
        productModelObjList[index].isFavorite;
    notifyListeners();
  }
}
