import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.provider.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return OrderItem(order: orderData.orders[index]);
        },
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
