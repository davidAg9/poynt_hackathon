import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/checkout/cart/model/cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(
                  imageUrl: cart.product.imgUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer(
                        gradient: const LinearGradient(
                          colors: [Colors.red, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        loop: 3,
                        child: Container(),
                      )),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}", style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
