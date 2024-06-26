import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoppingcart/model/product_model.dart';

class ProductController extends ChangeNotifier {
  List<ProductModel> productmodelObj = [];

  void addObjIncart({required ProductModel obj}) {
    log("Object added sucessfully");

    productmodelObj.add(obj);

    notifyListeners();
  }

  void addQuantityin({required int index}) {
    productmodelObj[index].quantity = productmodelObj[index].quantity += 1;
    notifyListeners();
  }

  void removeQuantity({required int index}) {
    productmodelObj[index].quantity = productmodelObj[index].quantity -= 1;
    notifyListeners();
  }
}
