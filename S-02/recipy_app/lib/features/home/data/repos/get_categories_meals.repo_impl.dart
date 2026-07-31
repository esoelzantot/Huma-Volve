import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipy_app/core/errors/error_handler.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_meals_remote_datasource.impl.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';
import 'package:recipy_app/features/home/domian/repos/get_categories_meals.repo.dart';

class GetCategoryMealsRepoImpl implements IMealsRepo {
  final GetCategoryMealsRemoteDataSourceImpl remote;

  GetCategoryMealsRepoImpl({required this.remote});

  @override
  Future<Either<Failure, List<MealEntity>>> getCategoryMeals({
    String? category,
  }) async {
    // TODO: implement getCategoryMeals
    try {
      List<MealEntity> remoteData = await remote.getCategoryMeals(
        category: category!,
      );
      return right(remoteData);
    } on DioException catch (e) {
      final failure = HandleError.handle(e);
      return left(failure);
    }
  }
}
