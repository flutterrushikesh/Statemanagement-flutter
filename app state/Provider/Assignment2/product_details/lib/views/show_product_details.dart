import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:product_details/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class ShowProductDetails extends StatefulWidget {
  const ShowProductDetails({super.key});
  @override
  State createState() => _ShowProductDetails();
}

class _ShowProductDetails extends State {
  @override
  Widget build(BuildContext context) {
    var objList = Provider.of<ProductController>(context).productModelObjList;
    print(objList);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
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
        itemCount: objList.length,
        // itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.network(objList[index].productImg!),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      objList[index].productName!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "₹ ${objList[index].productPrice!}",
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                    ),
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
                        "${objList[index].productQuantity}",
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
