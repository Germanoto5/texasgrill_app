import 'package:flutter/material.dart';
import 'package:texasgrill_app/models/product_menu.dart';

class ProductDetail extends StatelessWidget {
  final ProductMenu product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top:0, bottom: 30, left: 0, right: 0),
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              product.urlImagen != null && product.urlImagen!.isNotEmpty? 
              Center(
                child: Image.network(
                  product.urlImagen!,
                  width: 120,
                  height: 120,
                ),
              ) : Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                    child: Image.asset(
                      'assets/images/burguer.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ),
              
            ],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
                    textAlign: TextAlign.center,
                    product.nombre!,
                    style: TextStyle(
                        fontSize: 22, color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
          ),
                const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                textAlign: TextAlign.center,
                product.ingredientes != null && product.ingredientes!.isNotEmpty
                    ? product.ingredientes!
                    : "Pregunta los ingredientes en el restaurante.",
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
          
        ],
      ),
    );
  }
}
