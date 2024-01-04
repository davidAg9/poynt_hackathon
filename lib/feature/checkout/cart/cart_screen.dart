import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/checkout/cart/model/cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCart.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 30,
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
