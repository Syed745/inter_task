// product_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/model/product/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  // ignore: use_key_in_widget_constructors
  const ProductDetailScreen({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
        ],
        title: Text(
          product.title.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.network(product.image.toString())),
            const SizedBox(height: 16.0),
            Text(
              product.title.toString(),
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Price: \$${product.price.toString()}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(product.description.toString(),
                style: const TextStyle(fontSize: 16.0)),
            Row(
              children: [
                Text(product.rating!.rate.toString(),
                    style: const TextStyle(fontSize: 16.0)),
                Icon(Icons.star)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
