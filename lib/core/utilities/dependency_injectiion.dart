import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poynt_hackathon/core/constants/api.dart';
import 'package:poynt_hackathon/feature/Products/data/datasources/remote_datasource.dart';
import 'package:poynt_hackathon/feature/Products/data/repository/product_repo_implementation.dart';
import 'package:poynt_hackathon/feature/Products/domain/interfaces/product_repository.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
//!platform
  getIt.registerLazySingleton(() => Dio(BaseOptions(baseUrl: kBaseUrl)));
  //!remote datasources
  getIt.registerLazySingleton<ProductRemoteDataSource>(() => DioProductRemoteDataSource(api: getIt()));
  //! repositories

  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: getIt()));
  //!usecases

  //!bloc
}
