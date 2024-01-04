import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
