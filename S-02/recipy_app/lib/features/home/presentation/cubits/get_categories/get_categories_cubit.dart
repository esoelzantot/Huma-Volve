import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/core/services/use_case.dart';
import 'package:recipy_app/features/home/domian/use_cases/get_categories.usecase.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_categories/get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final GetCategoriesUseCase useCase;
  GetCategoriesCubit({required this.useCase}) : super(GetCategoriesInitial());

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    try {
      var result = await useCase.call(NoParams());
      result.fold(
        (failure) {
          emit(GetCategoriesFailure(errorMessage: failure.errorMessage));
        },
        (data) {
          emit(GetCategoriesSuccess(categories: data));
          // Store user globally
        },
      );
    } catch (error) {
      emit(GetCategoriesFailure(errorMessage: error.toString()));
    }
  }
}
