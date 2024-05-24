import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product details"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.network(
              Provider.of<ProductController>(context).productModelObj!.prodImg,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  Provider.of<ProductController>(context)
                      .productModelObj!
                      .prodName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "₹${Provider.of<ProductController>(context).productModelObj!.prodPrice}",
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
                        Provider.of<ProductController>(context, listen: false)
                            .addFavorite();
                      },
                      child: Icon(
                        (Provider.of<ProductController>(context, listen: false)
                                .productModelObj!
                                .isFavorite)
                            ? Icons.favorite_border_outlined
                            : Icons.favorite_rounded,
                        size: 25,
                      ),
                    );
                  },
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Provider.of<ProductController>(context, listen: false)
                        .addQuantity();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 5,
                ),
                Consumer(builder: (context, provider, child) {
                  return Text(
                    "${Provider.of<ProductController>(context).productModelObj!.prodCount}",
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
                    Provider.of<ProductController>(context, listen: false)
                        .removeQuantity();
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
      ),
    );
  }
}
