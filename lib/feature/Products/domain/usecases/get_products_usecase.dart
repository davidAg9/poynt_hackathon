import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_model.dart';
import 'package:poynt_hackathon/feature/Products/domain/interfaces/product_repository.dart';

final class GetProductsUsecase {
  final ProductRepository repo;

  GetProductsUsecase({required this.repo});

  Future<Either<ErrorDescription, List<PYProductModel>>> call() {
    return repo.getProducts();
  }
}
