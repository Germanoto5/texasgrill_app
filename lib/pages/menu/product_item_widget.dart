import 'package:flutter/material.dart';
import 'package:texasgrill_app/models/product_menu.dart';

class ProductWidget extends StatelessWidget {
  final ProductMenu product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
      ),
    );
  }
}