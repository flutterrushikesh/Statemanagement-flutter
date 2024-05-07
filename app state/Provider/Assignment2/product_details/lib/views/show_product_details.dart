import 'package:flutter/material.dart';
import 'package:product_details/controllers/product_controller.dart';
import 'package:product_details/controllers/wishlist_controller.dart';
import 'package:product_details/views/wishlist.dart';
import 'package:provider/provider.dart';

class ShowProductDetails extends StatefulWidget {
  const ShowProductDetails({super.key});
  @override
  State createState() => _ShowProductDetails();
}

class _ShowProductDetails extends State {
  @override
  Widget build(BuildContext context) {
    var objList = Provider.of<ProductController>(context, listen: false);
    // var objListWishlist=Provider.of<WishListController>(context).

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const Wishlist(),
                ),
              );
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
        backgroundColor: Colors.blue.shade200,
      ),
      body: ListView.builder(
        itemCount: objList.productModelObjList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.network(objList.productModelObjList[index].productImg!),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      objList.productModelObjList[index].productName!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "₹ ${objList.productModelObjList[index].productPrice!}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    const SizedBox(
                      width: 85,
                    ),
                    Consumer(builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<ProductController>(context)
                              .addToFavorite(index: index);
                          if (objList.productModelObjList[index].isFavorite!) {
                            Provider.of<WishListController>(context,
                                    listen: false)
                                .addToWishList(
                                    obj: objList.productModelObjList[index]);
                          }
                        },
                        child: Icon(
                          (objList.productModelObjList[index].isFavorite!)
                              ? Icons.favorite
                              : Icons.favorite_border_rounded,
                          color: Colors.pink,
                        ),
                      );
                    }),
                    const SizedBox(
                      width: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<ProductController>(context, listen: false)
                            .removeQuantity(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer(builder: (context, provider, child) {
                      return Text(
                        "${objList.productModelObjList[index].productQuantity}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      );
                    }),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Provider.of<ProductController>(context, listen: false)
                            .addQuantity(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
