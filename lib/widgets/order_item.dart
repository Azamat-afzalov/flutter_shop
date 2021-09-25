import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../providers/orders.provider.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;
  void onToggle() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: onToggle,
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 20.0, 100.0),
              child: ListView(
                children: widget.order.products
                    .map(
                      (product) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${product.title}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${product.quantity}x\$${product.price}',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
