import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:poynt_hackathon/feature/Products/domain/interfaces/product_repository.dart';

final class GetCategoriesUsecase {
  final ProductRepository repo;

  GetCategoriesUsecase({required this.repo});

  Future<Either<ErrorDescription, List<String>>> call() {
    return repo.getCategories();
  }
}
