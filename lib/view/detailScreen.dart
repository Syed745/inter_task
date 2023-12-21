// product_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/model/ProductDataModel.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
          const Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
        ],
        title: Text(
          product.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.network(product.image)),
            SizedBox(height: 16.0),
            Text(
              product.title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(product.description, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
