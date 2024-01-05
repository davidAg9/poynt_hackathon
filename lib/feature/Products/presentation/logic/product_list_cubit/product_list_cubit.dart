import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_model.dart';
import 'package:poynt_hackathon/feature/Products/domain/usecases/get_products_usecase.dart';

part 'product_list_state.dart';
part 'product_list_cubit.freezed.dart';

class ProductListCubit extends HydratedCubit<ProductListState> {
  final GetProductsUsecase getProductsUsecase;
  ProductListCubit(this.getProductsUsecase) : super(const ProductListState.initial());

  Future<void> getProducts([String filter = "men"]) async {
    emit(const ProductListState.loading());
    final result = await getProductsUsecase();

    result.fold((l) => emit(ProductListState.productListError(l.toDescription())), (products) {
      products.retainWhere((product) => product.category?.toLowerCase() == filter.toLowerCase());
      emit(ProductListState.loaded(products));
    });
  }

  @override
  ProductListState? fromJson(Map<String, dynamic> json) {
    final products = (json["data"] as List<Map<String, dynamic>>).map((productJson) => PYProductModel.fromJson(productJson)).toList();
    return ProductListState.loaded(products);
  }

  @override
  Map<String, dynamic>? toJson(ProductListState state) {
    if (state is _Loaded) {
      final products = state.products.map((product) => product.toJson()).toList();
      return {"data": products};
    }
    return null;
  }
}
