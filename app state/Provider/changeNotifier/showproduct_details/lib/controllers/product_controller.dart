import 'package:flutter/material.dart';
import 'package:showproduct_details/models/product_model.dart';

class ProductController extends ChangeNotifier {
  ProductModel? productModelObj;

  void addObj(ProductModel productModelObj) {
    this.productModelObj = productModelObj;
    notifyListeners();
  }

  void addFavorite() {
    productModelObj!.isFavorite = !productModelObj!.isFavorite;
    notifyListeners();
  }

  void addQuantity() {
    productModelObj!.prodCount = productModelObj!.prodCount + 1;
    notifyListeners();
  }

  void removeQuantity() {
    productModelObj!.prodCount = productModelObj!.prodCount - 1;
    notifyListeners();
  }
}
