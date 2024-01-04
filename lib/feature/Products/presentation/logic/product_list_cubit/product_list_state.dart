part of 'product_list_cubit.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = _Initial;

  const factory ProductListState.loading() = _Loading;
  const factory ProductListState.loaded(List<PYProductModel> products) = _Loaded;
  const factory ProductListState.productListError(String msg) = _ProductListError;
}
