import 'package:dio/dio.dart';
import 'package:recipy_app/core/constants/api_endpoints.dart';
import 'package:recipy_app/core/errors/server_exception.dart';
import 'package:recipy_app/core/services/api_services.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_remote.datasource.dart';
import 'package:recipy_app/features/home/data/models/category_model.dart';

class GetCategoriesRemoteDataSourceImpl
    implements GetCategoriesRemoteDataSource {
  final ApiServices api;

  GetCategoriesRemoteDataSourceImpl({required this.api});

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final String endPoint = ApiEndpoints.getCategories;
      final response = await api.get(endPoint: endPoint);

      final jsonRes = response.data["categories"] as List;
      final List<CategoryModel> categories = jsonRes
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      return categories;
    } on DioException catch (error) {
      throw ServerException(exception: error);
    }
  }
}
