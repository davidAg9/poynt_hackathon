import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_model.dart';

abstract interface class ProductRepository {
  Future<Either<ErrorDescription, List<PYProductModel>>> getProducts();
  Future<Either<ErrorDescription, List<String>>> getCategories();
}
