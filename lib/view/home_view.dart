import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/model/product/product.dart';
import 'package:flutter_trainee_test/repository/product_data_repo.dart';

import 'detailScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        actionsIconTheme: IconThemeData(color: Colors.white),
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
                            productList[index].image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          productList[index].title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          productList[index].category.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$${productList[index].price.toString()}',
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
