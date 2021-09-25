import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart.screen.dart';

// import '../providers/products.provider.dart';
import '../providers/cart.provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context);
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, ch) {
              return InkWell(
                child: Badge(
                  child: ch!,
                  value: cart.itemCount.toString(),
                ),
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              )
            ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ProductsGrid(showOnlyFavorites: _showOnlyFavorites),
      drawer: AppDrawer(),
    );
    return scaffold;
  }
}
