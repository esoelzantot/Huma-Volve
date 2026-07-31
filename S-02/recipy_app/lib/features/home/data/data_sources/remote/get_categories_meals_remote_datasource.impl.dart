import 'package:recipy_app/core/constants/api_endpoints.dart';
import 'package:recipy_app/core/services/api_services.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_meals_remote.datasource.dart';
import 'package:recipy_app/features/home/data/models/meal_model.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';

class GetCategoryMealsRemoteDataSourceImpl
    implements GetCategoriesMealsRemoteDataSource {
  final ApiServices api;

  GetCategoryMealsRemoteDataSourceImpl({required this.api});

  @override
  Future<List<MealEntity>> getCategoryMeals({required String category}) async {
    // TODO: implement getCategoryMeals
    final String endPoint = ApiEndpoints.getCategoryMeals.replaceAll(
      '{category}',
      category,
    );
    final response = await api.get(endPoint: endPoint);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final jsonRes = response.data["meals"] as List;
      final List<MealEntity> entities = jsonRes
          .map((e) => MealModel.fromJson(e))
          .toList();

      return entities;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
