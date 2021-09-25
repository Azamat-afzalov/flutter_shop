import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // product id
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${loadedProduct.title}',
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
