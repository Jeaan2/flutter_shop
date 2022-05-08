import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/order_list.dart';
import 'package:flutter_shop/models/product_list.dart';
import 'package:flutter_shop/pages/cart_page.dart';
import 'package:flutter_shop/pages/orders_page.dart';
import 'package:flutter_shop/pages/product_detail_page.dart';
import 'package:flutter_shop/pages/products_overview_page.dart';
import 'package:flutter_shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        routes: {
          AppRoutes.HOME: (context) => ProductOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailPage(),
          AppRoutes.CART: (context) => CartPage(),
          AppRoutes.ORDERS: (context) => OrdersPage(),
        },
      ),
    );
  }
}
