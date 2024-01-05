import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poynt_hackathon/feature/Products/presentation/components/productCard.dart';
import 'package:poynt_hackathon/feature/Products/presentation/logic/product_list_cubit/product_list_cubit.dart';
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
            child: SectionTitle(title: categoryname, press: () {}),
          ),
          BlocBuilder<ProductListCubit, ProductListState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loading: (_) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                loaded: (value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: value.products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ProductCard(
                        productModel: value.products[index],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
