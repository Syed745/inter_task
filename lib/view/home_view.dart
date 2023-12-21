import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/model/ProductDataModel.dart';
import 'package:flutter_trainee_test/repository/product_data_repo.dart';

import 'detailScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FakeStoreApiService apiService = FakeStoreApiService();

  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = apiService.getProducts();
  }

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
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            color: Color(0xffe5e5e5),
          ),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> productList = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: productList[index]),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            productList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          productList[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          productList[index].category,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$${productList[index].price.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
