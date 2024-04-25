import 'package:flutter/material.dart';
import 'package:product/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});
  @override
  State createState() => _DisplayDataState();
}

class _DisplayDataState extends State {
  @override
  Widget build(BuildContext context) {
    var prodObj = Provider.of<ProductController>(context).productModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Show details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    offset: Offset(2, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(prodObj!.productImg!),
                  Text(
                    prodObj.productName!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "₹ ${prodObj.productPrice!}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Consumer(builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        Provider.of<ProductController>(context, listen: false)
                            .isToggle();
                      },
                      child: Icon(
                        prodObj.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: Colors.pink,
                      ),
                    );
                  }),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      var prodQuantity = prodObj.productQuantity;
                      Provider.of<ProductController>(context, listen: false)
                          .removeQuantity(prodQuantity!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Consumer(builder: (context, provider, child) {
                    return Text(
                      "${prodObj.productQuantity}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    );
                  }),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<ProductController>(context, listen: false)
                          .addQuantity();
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
            ),
          ],
        ),
      ),
    );
  }
}
