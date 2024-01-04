import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Categories extends StatelessWidget {
  final List<String> categories;
  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "Flash Deal",
      "Bill",
      "Game",
      "Daily Gift",
      "More",
    ];
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => Text(categories[0]),
        ),
      ),
    );
  }
}
