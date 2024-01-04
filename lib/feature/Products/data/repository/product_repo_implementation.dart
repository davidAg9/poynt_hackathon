import 'package:dartz/dartz.dart';
import 'package:flutter/src/foundation/assertions.dart';
import 'package:poynt_hackathon/feature/Products/data/datasources/remote_datasource.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_model.dart';
import 'package:poynt_hackathon/feature/Products/domain/interfaces/product_repository.dart';

final class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<ErrorDescription, List<String>>> getCategories() async {
    try {
      final result = await remoteDataSource.getCategories();
      return right(result);
    } catch (e) {
      return left(ErrorDescription(e.toString()));
    }
  }

  @override
  Future<Either<ErrorDescription, List<PYProductModel>>> getProducts() async {
    try {
      final result = await remoteDataSource.getProducts();
      return right(result);
    } catch (e) {
      return left(ErrorDescription(e.toString()));
    }
  }
}
