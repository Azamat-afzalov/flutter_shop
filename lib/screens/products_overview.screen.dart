import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';
import '../models/product.model.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
      ),
      body: ProductsGrid(),
    );
    return scaffold;
  }
}
