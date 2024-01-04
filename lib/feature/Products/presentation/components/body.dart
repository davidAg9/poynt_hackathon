import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'categories.dart';
import 'home_header.dart';
import 'product_list.dart';

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
            const Categories(
              categories: [],
            ),
            SizedBox(height: 3.h),
            const ProductList(
              categoryname: 'Popular',
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
