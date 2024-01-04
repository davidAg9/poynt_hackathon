import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'section_title.dart';

class ProductList extends StatelessWidget {
  final String categoryname;

  const ProductList({super.key, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: SectionTitle(title: "Products", press: () {}),
        ),
        SizedBox(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 20.w),
            ],
          ),
        )
      ],
    );
  }
}
