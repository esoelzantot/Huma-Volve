import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';

abstract class GetCategoriesMealsRemoteDataSource {
  Future<List<MealEntity>> getCategoryMeals({required String category});
}
