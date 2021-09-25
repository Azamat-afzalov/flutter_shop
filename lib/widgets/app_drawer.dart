import 'package:flutter/material.dart';
import '../screens/orders.screen.dart';
import '../screens/products_overview.screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              print(OrdersScreen.routeName);
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
