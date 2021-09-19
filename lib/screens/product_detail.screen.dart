import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';
  // final String title;
  // final double price;
  const ProductDetail({
    Key? key,
    // required this.title,
    // required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // product id
    return Scaffold(
      appBar: AppBar(
        title: Text(productId),
      ),
      body: Container(),
    );
  }
}
