import 'package:flutter/material.dart';
import 'package:product_details/controllers/product_controller.dart';
import 'package:product_details/models/product_model.dart';
import 'package:product_details/views/show_product_details.dart';
import 'package:provider/provider.dart';

class GetProductDetails extends StatefulWidget {
  const GetProductDetails({super.key});
  @override
  State createState() => _GetProductDetailsState();
}

class _GetProductDetailsState extends State {
  TextEditingController productImgController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceCOntroller = TextEditingController();

  //validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get Product Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: productImgController,
                decoration: InputDecoration(
                  hintText: "Product URL",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 2, 30, 172),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 2, 30, 172),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter product URL";
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                  hintText: "Product name",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 2, 30, 172),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 2, 30, 172),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter product name";
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: productPriceCOntroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Product price",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 2, 30, 172),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 2, 30, 172),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter product price";
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  var obj = ProductModel(
                      productImg: productImgController.text.trim(),
                      productName: productNameController.text.trim(),
                      productPrice: productPriceCOntroller.text.trim(),
                      productQuantity: 0,
                      isFavorite: false);

                  Provider.of<ProductController>(context, listen: false)
                      .addProduct(obj);
                  clearControllers();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.blue.shade200),
                ),
                child: const Text(
                  "Add product",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ShowProductDetails(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.blue.shade200),
                ),
                child: const Text(
                  "Show products",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearControllers() {
    productImgController.clear();
    productNameController.clear();
    productPriceCOntroller.clear();
  }
}
