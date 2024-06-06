import 'package:flutter/material.dart';
import 'package:texasgrill_app/models/promotion.dart';

class PromotionWidget extends StatefulWidget {
  final Promotion promotion;
  const PromotionWidget({super.key, required this.promotion});

  @override
  State<PromotionWidget> createState() => _PromotionWidgetState();
}

class _PromotionWidgetState extends State<PromotionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
          image: AssetImage("assets/images/imagenOferta.jpg"),
          fit: BoxFit.cover,
        ),
      ),
        height: 300,
        child: Material(
          color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.promotion.nombre!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 30
                ),),
                Text(widget.promotion.descripcion!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 20
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
