import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//screens
import './screens/products_overview.screen.dart';
import './screens/product_detail.screen.dart';
import './screens/cart.screen.dart';
import './screens/orders.screen.dart';

// Providers
import './providers/products.provider.dart';
import './providers/cart.provider.dart';
import './providers/orders.provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          textTheme: TextTheme(),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
