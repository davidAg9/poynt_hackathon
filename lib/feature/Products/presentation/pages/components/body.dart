import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'categories.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            const HomeHeader(),
            SizedBox(height: 1.h),
            const Categories(),
            SizedBox(height: 3.h),
            const PopularProducts(),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
