import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/controller/product_controller.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State {
  @override
  Widget build(BuildContext context) {
    dynamic providerObj =
        Provider.of<ProductController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Products',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: providerObj.productmodelObj.length,
        itemBuilder: (context, index) {
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
                  providerObj.productmodelObj[index].imagePath,
                  height: 80,
                ),
                // const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      providerObj.productmodelObj[index].productName,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      providerObj.productmodelObj[index].productPrice,
                      style: GoogleFonts.inter(
                        // fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Provider.of<ProductController>(context, listen: false)
                              .addQuantityin(index: index);
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Consumer(builder: (context, provider, child) {
                        return Text(
                          '${providerObj.productmodelObj[index].quantity}',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        );
                      }),
                      const SizedBox(width: 7),
                      GestureDetector(
                        onTap: () {
                          Provider.of<ProductController>(context, listen: false)
                              .removeQuantity(index: index);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
