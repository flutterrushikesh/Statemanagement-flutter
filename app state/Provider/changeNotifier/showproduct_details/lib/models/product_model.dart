class ProductModel {
  String prodName;
  String prodImg;
  String prodPrice;
  int prodCount;
  bool isFavorite;

  ProductModel(
      {required this.isFavorite,
      required this.prodCount,
      required this.prodImg,
      required this.prodName,
      required this.prodPrice});
}
