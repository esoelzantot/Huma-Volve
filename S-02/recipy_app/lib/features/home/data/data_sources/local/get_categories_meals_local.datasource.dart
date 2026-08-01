import 'package:recipy_app/features/home/data/models/meal_model.dart';

abstract class GetCategoriesMealsLocalDataSource {
  Future<void> cacheMeals({
    required String category,
    required List<MealModel> meals,
  });

  Future<List<MealModel>> getCachedMeals({required String category});

  Future<void> clearCachedMeals({required String category});
}
