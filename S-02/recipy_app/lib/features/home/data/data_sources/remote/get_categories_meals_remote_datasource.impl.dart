import 'package:dio/dio.dart';
import 'package:recipy_app/core/constants/api_endpoints.dart';
import 'package:recipy_app/core/errors/server_exception.dart';
import 'package:recipy_app/core/services/api_services.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_meals_remote.datasource.dart';
import 'package:recipy_app/features/home/data/models/meal_model.dart';

class GetCategoryMealsRemoteDataSourceImpl
    implements GetCategoriesMealsRemoteDataSource {
  final ApiServices api;

  GetCategoryMealsRemoteDataSourceImpl({required this.api});

  @override
  Future<List<MealModel>> getCategoryMeals({required String category}) async {
    // TODO: implement getCategoryMeals
    try {
      final String endPoint = ApiEndpoints.getCategoryMeals.replaceAll(
        '{category}',
        category,
      );
      final response = await api.get(endPoint: endPoint);

      final jsonRes = response.data["meals"] as List;
      final List<MealModel> meals = jsonRes
          .map((e) => MealModel.fromJson(e))
          .toList();

      return meals;
    } on DioException catch (error) {
      throw ServerException(exception: error);
    }
  }
}
