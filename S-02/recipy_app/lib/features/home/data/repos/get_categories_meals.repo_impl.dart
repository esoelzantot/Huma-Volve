import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/cach_exception.dart';
import 'package:recipy_app/core/errors/error_handler.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/errors/server_exception.dart';
import 'package:recipy_app/features/home/data/data_sources/local/get_categories_meals_local_datasource.impl.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_meals_remote_datasource.impl.dart';
import 'package:recipy_app/features/home/data/models/meal_model.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';
import 'package:recipy_app/features/home/domian/repos/get_categories_meals.repo.dart';

class GetCategoryMealsRepoImpl implements IMealsRepo {
  final GetCategoryMealsRemoteDataSourceImpl remote;
  final GetCategoriesMealsLocalDataSourceImpl local;

  GetCategoryMealsRepoImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<MealEntity>>> getCategoryMeals({
    String? category,
  }) async {
    // TODO: implement getCategoryMeals
    try {
      List<MealModel> remoteData = await remote.getCategoryMeals(
        category: category!,
      );
      await local.cacheMeals(category: category, meals: remoteData);
      return right(remoteData);
    } on ServerException catch (e) {
      try {
        List<MealModel> localData = await local.getCachedMeals(
          category: category!,
        );
        List<MealEntity> entities = localData;
        return right(entities);
      } on CacheException {
        final handler = HandleError.handle(e.exception);
        return left(handler);
      }
    }
  }
}
