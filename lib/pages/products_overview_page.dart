import 'package:flutter/material.dart';
import 'package:flutter_shop/components/app_drawer.dart';
import 'package:flutter_shop/components/badge.dart';
import 'package:flutter_shop/components/product_grid.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/product_list.dart';
import 'package:flutter_shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverviewPage extends StatefulWidget {
  ProductOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minha Loja'), actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('Somente favoritos'),
              value: FilterOptions.Favorite,
            ),
            PopupMenuItem(
              child: Text('Todos'),
              value: FilterOptions.All,
            ),
          ],
          onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.Favorite) {
                _showFavoriteOnly = true;
              } else {
                _showFavoriteOnly = false;
              }
            });
          },
        ),
        Consumer<Cart>(
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CART);
            },
            icon: Icon(Icons.shopping_cart),
          ),
          builder: (ctx, cart, child) => Badge(
            value: cart.itemsCount.toString(),
            child: child!,
          ),
        ),
      ]),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ProductGrid(_showFavoriteOnly),
      drawer: AppDrawer(),
    );
  }
}
