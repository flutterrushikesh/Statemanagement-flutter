class ProductModel {
  String? productImg;
  String? productName;
  String? productPrice;
  int? productQuantity = 0;
  bool isFavorite = false;

  ProductModel({
    this.productImg,
    this.productName,
    this.productPrice,
    this.productQuantity,
    this.isFavorite = false,
  });
}
