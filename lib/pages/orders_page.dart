import 'package:flutter/material.dart';
import 'package:flutter_shop/components/app_drawer.dart';
import 'package:flutter_shop/components/order.dart';
import 'package:flutter_shop/models/order_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orders.itemsCount,
          itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i])),
    );
  }
}
