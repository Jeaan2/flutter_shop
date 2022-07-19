import 'package:flutter/material.dart';
import 'package:flutter_shop/models/auth.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/order_list.dart';
import 'package:flutter_shop/models/product_list.dart';
import 'package:flutter_shop/pages/auth_or_home_page.dart';
import 'package:flutter_shop/pages/auth_page.dart';
import 'package:flutter_shop/pages/cart_page.dart';
import 'package:flutter_shop/pages/orders_page.dart';
import 'package:flutter_shop/pages/product_detail_page.dart';
import 'package:flutter_shop/pages/product_form_page.dart';
import 'package:flutter_shop/pages/products_page.dart';
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
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList('', []),
          update: (context, auth, previous) {
            return ProductList(auth.token ?? '', previous?.items ?? []);
          },
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
          AppRoutes.AUTH_OR_HOME: (context) => AuthOrHomePage(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailPage(),
          AppRoutes.CART: (context) => CartPage(),
          AppRoutes.ORDERS: (context) => OrdersPage(),
          AppRoutes.PRODUCTS: (context) => ProductsPage(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormPage(),
        },
      ),
    );
  }
}
