import 'package:flutter/material.dart';
import 'dart:developer';

class Order extends StatefulWidget {
  final String foodName;

  const Order({super.key, required this.foodName});

  @override
  State createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int OrderCount = 0;
  @override
  Widget build(BuildContext context) {
    log("In Order Build");
    log(widget.foodName);
    log("$OrderCount");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              OrderCount++;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.amber.shade200,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.10),
                  blurRadius: 10,
                  offset: Offset(-4, 4),
                ),
              ],
            ),
            child: Text(
              widget.foodName,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "OrderCount: $OrderCount",
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
