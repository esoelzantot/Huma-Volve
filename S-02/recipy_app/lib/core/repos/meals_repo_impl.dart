import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipy_app/core/constants/api_endpoints.dart';
import 'package:recipy_app/core/errors/error_handler.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/models/category_model.dart';
import 'package:recipy_app/core/models/meal_model.dart';
import 'package:recipy_app/core/repos/meals_repo.dart';
import 'package:recipy_app/core/services/api_services.dart';

class MealsRepoImpl implements IMealsRepo {
  final api = ApiServices();
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final String endPoint = ApiEndpoints.getCategories;
      final response = await api.get(endPoint: endPoint);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final jsonRes = response.data["categories"] as List;
        final modelRes = jsonRes
            .map(((e) => CategoryModel.fromJson(e)))
            .toList();
        return right(modelRes);
      } else {
        throw Exception("Something went wrong");
      }
    } on DioException catch (e) {
      final failure = HandleError.handle(e);
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> getCategoryMeals({
    String? category,
  }) async {
    // TODO: implement getCategoryMeals
    try {
      final String endPoint = ApiEndpoints.getCategoryMeals.replaceAll(
        '{category}',
        category!,
      );
      final response = await api.get(endPoint: endPoint);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final jsonRes = response.data["meals"] as List;
        final modelRes = jsonRes.map(((e) => MealModel.fromJson(e))).toList();
        return right(modelRes);
      } else {
        throw Exception("Something went wrong");
      }
    } on DioException catch (e) {
      final failure = HandleError.handle(e);
      return left(failure);
    }
  }
}
