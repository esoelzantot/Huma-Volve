import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/features/home/domian/use_cases/get_categories_meals.usecase.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_meals/get_meals_state.dart';

class GetMealsCubit extends Cubit<GetMealsState> {
  final GetCategoryMealsUseCase useCase;
  GetMealsCubit({required this.useCase}) : super(GetMealsInitial());

  Future<void> getCategoryMeals({required String category}) async {
    emit(GetMealsLoading());
    try {
      var result = await useCase.call(category);
      result.fold(
        (failure) {
          emit(GetMealsFailure(errorMessage: failure.errorMessage));
        },
        (data) {
          emit(GetMealsSuccess(meals: data));
          // Store user globally
        },
      );
    } catch (error) {
      emit(GetMealsFailure(errorMessage: error.toString()));
    }
  }
}
