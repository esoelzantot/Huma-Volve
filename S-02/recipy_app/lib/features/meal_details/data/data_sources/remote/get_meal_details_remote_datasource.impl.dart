import 'package:recipy_app/core/constants/api_endpoints.dart';
import 'package:recipy_app/core/services/api_services.dart';
import 'package:recipy_app/features/meal_details/data/data_sources/remote/get_meal_details_remote.datasource.dart';
import 'package:recipy_app/features/meal_details/data/models/meal_details_model.dart';
import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';

class GetMealDetailsRemoteDataSourceImpl
    implements GetMealDetailsRemoteDataSource {
  final ApiServices api;

  GetMealDetailsRemoteDataSourceImpl({required this.api});

  @override
  Future<MealDetailsEntity> getMealDetails({required String id}) async {
    // TODO: implement getMealDetails
    final String endPoint = ApiEndpoints.getMealDetails.replaceAll('{id}', id);
    final response = await api.get(endPoint: endPoint);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final jsonRes = response.data["meals"] as List;
      final MealDetailsEntity entity = MealDetailsModel.fromJson(jsonRes.first);

      return entity;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
