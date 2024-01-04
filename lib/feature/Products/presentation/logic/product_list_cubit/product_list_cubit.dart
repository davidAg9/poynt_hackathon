import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_model.dart';
import 'package:poynt_hackathon/feature/Products/domain/usecases/get_products_usecase.dart';

part 'product_list_state.dart';
part 'product_list_cubit.freezed.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final GetProductsUsecase getProductsUsecase;
  ProductListCubit(this.getProductsUsecase) : super(const ProductListState.initial());

  Future<void> getProducts() async {
    emit(const ProductListState.loading());
    final result = await getProductsUsecase();

    result.fold(
      (l) => emit(ProductListState.productListError(l.toDescription())),
      (categories) => emit(ProductListState.loaded(categories)),
    );
  }
}
