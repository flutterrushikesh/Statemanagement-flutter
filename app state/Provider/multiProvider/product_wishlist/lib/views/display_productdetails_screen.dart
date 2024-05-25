import 'package:flutter/material.dart';
import 'package:product_wishlist/controllers/wishlist_controller.dart';
import 'package:product_wishlist/views/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:product_wishlist/controllers/product_controller.dart';

class DisplayProductDetails extends StatefulWidget {
  const DisplayProductDetails({super.key});

  @override
  State createState() => _DisplayProducrDetailsState();
}

class _DisplayProducrDetailsState extends State {
  @override
  Widget build(BuildContext context) {
    var listOfObj = Provider.of<ProductController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const WishlistScreen();
                  },
                ),
              );
            },
            child: const Icon(
              Icons.favorite_rounded,
              color: Colors.pink,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const Text("Product details"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount:
            Provider.of<ProductController>(context).productModelObjList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Image.network(listOfObj.productModelObjList[index]!.prodImg),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      listOfObj.productModelObjList[index]!.prodName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "₹${listOfObj.productModelObjList[index]!.prodPrice}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 80,
                    ),
                    Consumer(
                      builder: (context, provider, child) {
                        return GestureDetector(
                          onTap: () {
                            listOfObj.addFavorite(index);
                            if (listOfObj
                                .productModelObjList[index].isFavorite) {
                              Provider.of<WishlistController>(context)
                                  .addToWishlist(
                                      listOfObj.productModelObjList[index]);
                            }
                          },
                          child: Icon(
                            listOfObj.productModelObjList[index]!.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_outlined,
                            color: Colors.pink,
                            size: 25,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        listOfObj.addQuantity(index);
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Consumer(builder: (context, provider, child) {
                      return Text(
                        "${listOfObj.productModelObjList[index]!.prodCount}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        listOfObj.removeQuantity(index);
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 70,
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
