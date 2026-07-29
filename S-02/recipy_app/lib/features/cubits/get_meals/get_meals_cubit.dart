import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/core/repos/meals_repo_impl.dart';
import 'package:recipy_app/features/cubits/get_meals/get_meals_state.dart';

class GetMealsCubit extends Cubit<GetMealsState> {
  final MealsRepoImpl repo;
  GetMealsCubit({required this.repo}) : super(GetMealsInitial());

  Future<void> getCategoryMeals({required String category}) async {
    emit(GetMealsLoading());
    try {
      var result = await repo.getCategoryMeals(category: category);
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
