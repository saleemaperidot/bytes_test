import 'dart:io';

import 'package:flutter/material.dart';
import 'package:providerskel/data/models/products_model/product.dart';

class Product_screen extends StatelessWidget {
  const Product_screen({super.key, required Product this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                  fit: BoxFit.cover,
                  // width: MediaQuery.of(context).size.width * 0.36,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  image: NetworkImage(product.image![0].url!)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("500g"), Text("Energy roaster")],
          ),
          Text(product.title!),
          Text(product.statusText!),
          Text(product.discountPrice!.toString())
        ],
      )),
    );
  }
}
