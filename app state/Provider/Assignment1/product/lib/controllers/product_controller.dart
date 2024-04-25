import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:product/models/product_model.dart';

class ProductController extends ChangeNotifier {
  ProductModel? productModel;

  void addProductData(ProductModel productModel) {
    this.productModel = productModel;
  }

  void isToggle() {
    productModel!.isFavorite = !productModel!.isFavorite;
    notifyListeners();
  }

  void addQuantity() {
    log("IN add ");
    productModel!.productQuantity = productModel!.productQuantity! + 1;
    notifyListeners();
  }

  void removeQuantity(int productQuantity) {
    log("in remove");

    productModel!.productQuantity = productModel!.productQuantity! - 1;
    notifyListeners();
  }
}
