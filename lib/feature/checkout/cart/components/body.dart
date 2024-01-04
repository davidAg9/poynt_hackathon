import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/checkout/cart/model/cart.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: demoCart.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCart[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCart.removeAt(index);
              });
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.delete_outlined,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            child: CartCard(cart: demoCart[index]),
          ),
        ),
      ),
    );
  }
}
