import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/controller/product_controller.dart';
import 'package:shoppingcart/model/product_model.dart';
import 'package:shoppingcart/views/mycart_screen.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State {
  List<ProductModel> productModelObj = [
    ProductModel(
      productName: "Banana",
      productPrice: "Dozen \$40",
      imagePath: 'assets/images/banana.jpeg',
      quantity: 1,
    ),
    ProductModel(
      productName: "Chery",
      productPrice: "KG \$50",
      imagePath: 'assets/images/chery.jpeg',
      quantity: 1,
    ),
    ProductModel(
      productName: "Orange",
      productPrice: "Dozen \$80",
      imagePath: 'assets/images/orange.jpeg',
      quantity: 1,
    ),
    ProductModel(
      productName: "Mango",
      productPrice: "Dozen \$180",
      imagePath: 'assets/images/mango.jpeg',
      quantity: 1,
    ),
    ProductModel(
      productName: "Grapes",
      productPrice: "KG \$60",
      imagePath: 'assets/images/grapes.jpeg',
      quantity: 1,
    ),
    ProductModel(
      productName: "Peach",
      productPrice: "KG \$150",
      imagePath: 'assets/images/peach.jpeg',
      quantity: 1,
    ),
    ProductModel(
      productName: "Pinapple",
      productPrice: "Pic \$20",
      imagePath: 'assets/images/pineaple.jpeg',
      quantity: 1,
    ),
    ProductModel(
      productName: "Mixed Fruit Basket",
      productPrice: "KG \$20",
      imagePath: 'assets/images/mixed.jpeg',
      quantity: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MyCartScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 28,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productModelObj.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 16,
                    spreadRadius: -4,
                    offset: Offset(0, 4))
              ],
              color: Colors.white,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  productModelObj[index].imagePath,
                  height: 80,
                ),
                // const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModelObj[index].productName,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      productModelObj[index].productPrice,
                      style: GoogleFonts.inter(
                        // fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Provider.of<ProductController>(context, listen: false)
                        .addObjIncart(obj: productModelObj[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text(
                            "${productModelObj[index].productName} successfully added in cart"),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
