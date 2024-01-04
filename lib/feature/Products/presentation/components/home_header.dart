import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/checkout/cart/cart_screen.dart';
import 'package:sizer/sizer.dart';

import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconBtnWithCounter(
            icon: Icons.shopping_cart_outlined,
            press: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())),
          ),
        ],
      ),
    );
  }
}
