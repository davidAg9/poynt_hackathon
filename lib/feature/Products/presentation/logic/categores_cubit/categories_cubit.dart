import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poynt_hackathon/feature/Products/domain/usecases/get_categories_usecase.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUsecase getCategoriesUsecase;

  CategoriesCubit(this.getCategoriesUsecase) : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.loading());
    final result = await getCategoriesUsecase();

    result.fold(
      (l) => emit(CategoriesState.productListError(l.toDescription())),
      (categories) => emit(CategoriesState.loaded(categories)),
    );
  }
}
