import 'package:hive/hive.dart';
import 'package:recipy_app/core/errors/cach_exception.dart';
import 'package:recipy_app/features/home/data/data_sources/local/get_categories_meals_local.datasource.dart';
import 'package:recipy_app/features/home/data/models/meal_model.dart';
import 'package:recipy_app/features/home/data/models/meals_cache_model.dart';

class GetCategoriesMealsLocalDataSourceImpl
    implements GetCategoriesMealsLocalDataSource {
  final Box<MealsCacheModel> mealsBox;

  GetCategoriesMealsLocalDataSourceImpl({required this.mealsBox});

  @override
  Future<void> cacheMeals({
    required String category,
    required List<MealModel> meals,
  }) async {
    // TODO: implement cacheMeals
    await mealsBox.put(category, MealsCacheModel(meals: meals));
  }

  @override
  Future<void> clearCachedMeals({required String category}) async {
    // TODO: implement clearCachedMeals
    await mealsBox.delete(category);
  }

  @override
  Future<List<MealModel>> getCachedMeals({required String category}) async {
    // TODO: implement getCachedMeals
    final mealsCache = mealsBox.get(category);
    if (mealsCache == null) {
      throw CacheException(
        message: 'No cached meals found for category $category',
      );
    }
    return mealsCache.meals;
  }
}
