import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/core/constants/app_colors.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';
import 'package:recipy_app/features/meal_details/presentation/cubits/get_meal_details_cubit.dart';
import 'package:recipy_app/features/meal_details/presentation/cubits/get_meal_details_state.dart';
import 'package:recipy_app/features/meal_details/presentation/widgets/meal_details_error_view.dart';
import 'package:recipy_app/features/meal_details/presentation/widgets/meal_details_loading_view.dart';
import 'package:recipy_app/features/meal_details/presentation/widgets/meal_details_success_view.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealEntity meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final mealTitle = meal.name;
    final imageUrl = meal.image;
    final mealId = meal.id;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<GetMealDetailsCubit, GetMealDetailsState>(
        builder: (context, state) {
          if (state is GetMealDetailsLoading) {
            return MealDetailsLoadingView(
              mealTitle: mealTitle,
              imageUrl: imageUrl,
            );
          } else if (state is GetMealDetailsFailure) {
            return MealDetailsErrorView(
              mealTitle: mealTitle,
              imageUrl: imageUrl,
              mealId: mealId,
              errorMessage: state.errorMessage,
            );
          } else if (state is GetMealDetailsSuccess) {
            return MealDetailsSuccessView(
              initialMeal: meal,
              mealDetail: state.meal,
            );
          }
          return MealDetailsLoadingView(
            mealTitle: mealTitle,
            imageUrl: imageUrl,
          );
        },
      ),
    );
  }
}
