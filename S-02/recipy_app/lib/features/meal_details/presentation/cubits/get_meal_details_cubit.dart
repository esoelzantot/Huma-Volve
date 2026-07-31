import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/features/meal_details/domain/use_cases/get_meal_details.usecase.dart';
import 'package:recipy_app/features/meal_details/presentation/cubits/get_meal_details_state.dart';

class GetMealDetailsCubit extends Cubit<GetMealDetailsState> {
  final GetMealDetailsUseCase useCase;
  GetMealDetailsCubit({required this.useCase}) : super(GetMealDetailsInitial());

  Future<void> getMealDetails({required String id}) async {
    emit(GetMealDetailsLoading());
    try {
      var result = await useCase.call(id);
      result.fold(
        (failure) {
          emit(GetMealDetailsFailure(errorMessage: failure.errorMessage));
        },
        (data) {
          emit(GetMealDetailsSuccess(meal: data));
          // Store user globally
        },
      );
    } catch (error) {
      emit(GetMealDetailsFailure(errorMessage: error.toString()));
    }
  }
}
