import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: SectionTitle(title: "Popular Products", press: () {}),
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
