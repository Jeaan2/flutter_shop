import 'package:flutter/material.dart';
import 'package:flutter_shop/data/dummy_data.dart';
import 'package:flutter_shop/models/product.dart';

class ProductOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;

  ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: loadedProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) => Text(loadedProducts[index].title),
        ),
      ),
    );
  }
}
