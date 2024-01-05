import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poynt_hackathon/core/utilities/dependency_injectiion.dart';
import 'package:poynt_hackathon/feature/Products/presentation/logic/product_list_cubit/product_list_cubit.dart';
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
            Column(
              children: [
                BlocProvider<ProductListCubit>(
                  create: (context) => getIt()..getProducts(),
                  child: const ProductList(
                    categoryname: 'Men',
                  ),
                ),
                BlocProvider<ProductListCubit>(
                  create: (context) => getIt()..getProducts("bags"),
                  child: const ProductList(
                    categoryname: 'Shoes',
                  ),
                ),
                BlocProvider<ProductListCubit>(
                  create: (context) => getIt()..getProducts("bags"),
                  child: const ProductList(
                    categoryname: 'Bags',
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
