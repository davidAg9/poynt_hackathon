import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_model.dart';
import 'package:poynt_hackathon/feature/Products/presentation/components/productCard.dart';
import 'package:sizer/sizer.dart';

import 'section_title.dart';

class ProductList extends StatelessWidget {
  final String categoryname;

  const ProductList({super.key, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: SectionTitle(title: "All Products", press: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: demoProducts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ProductCard(productModel: demoProducts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
