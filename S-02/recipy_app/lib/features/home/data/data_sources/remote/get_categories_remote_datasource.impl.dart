import 'package:recipy_app/core/constants/api_endpoints.dart';
import 'package:recipy_app/core/services/api_services.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_remote.datasource.dart';
import 'package:recipy_app/features/home/data/models/category_model.dart';
import 'package:recipy_app/features/home/domian/entities/category.entity.dart';

class GetCategoriesRemoteDataSourceImpl
    implements GetCategoriesRemoteDataSource {
  final ApiServices api;

  GetCategoriesRemoteDataSourceImpl({required this.api});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final String endPoint = ApiEndpoints.getCategories;
    final response = await api.get(endPoint: endPoint);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final jsonRes = response.data["categories"] as List;
      final List<CategoryEntity> entities = jsonRes
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      return entities;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
