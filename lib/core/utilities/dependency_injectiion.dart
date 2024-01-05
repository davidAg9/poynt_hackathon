import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poynt_hackathon/core/constants/api.dart';
import 'package:poynt_hackathon/feature/Products/data/datasources/remote_datasource.dart';
import 'package:poynt_hackathon/feature/Products/data/repository/product_repo_implementation.dart';
import 'package:poynt_hackathon/feature/Products/domain/interfaces/product_repository.dart';
import 'package:poynt_hackathon/feature/Products/domain/usecases/get_categories_usecase.dart';
import 'package:poynt_hackathon/feature/Products/domain/usecases/get_products_usecase.dart';
import 'package:poynt_hackathon/feature/Products/presentation/logic/categores_cubit/categories_cubit.dart';
import 'package:poynt_hackathon/feature/Products/presentation/logic/product_list_cubit/product_list_cubit.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
//!platform
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  getIt.registerLazySingleton(() => Dio(BaseOptions(baseUrl: kBaseUrl, headers: {"Content-Type": "application/json"})));
  //!remote datasources
  getIt.registerLazySingleton<ProductRemoteDataSource>(() => DioProductRemoteDataSource(api: getIt()));

  //! repositories
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: getIt()));

  //!usecases
  getIt.registerLazySingleton(() => GetCategoriesUsecase(repo: getIt()));
  getIt.registerLazySingleton(() => GetProductsUsecase(repo: getIt()));

  //!bloc
  getIt.registerFactory(() => ProductListCubit(getIt()));
  getIt.registerFactory(() => CategoriesCubit(getIt()));
}
