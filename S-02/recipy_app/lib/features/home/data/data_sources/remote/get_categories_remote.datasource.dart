import 'package:recipy_app/features/home/data/models/category_model.dart';

abstract class GetCategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}
