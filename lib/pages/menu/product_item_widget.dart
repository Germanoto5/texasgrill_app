import 'package:flutter/material.dart';
import 'package:texasgrill_app/models/product_menu.dart';
import 'package:texasgrill_app/pages/menu/product_detail_popup_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductMenu product;
  const ProductWidget({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ProductDetail(product: product);
              },
            );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width/2 -20,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              product.urlImagen != null && product.urlImagen!.isNotEmpty? 
              Center(
                child: Image.network(
                  product.urlImagen!,
                  width: 120,
                  height: 120,
                ),
              ) : Center(
                child: Image.asset(
                  'assets/images/burguer.png',
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.nombre!.toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary, fontSize: 16),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                    "${product.precio!.toString()} €",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 20),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
