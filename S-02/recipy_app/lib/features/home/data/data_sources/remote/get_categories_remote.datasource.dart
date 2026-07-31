import 'package:recipy_app/features/home/domian/entities/category.entity.dart';

abstract class GetCategoriesRemoteDataSource {
  Future<List<CategoryEntity>> getCategories();
}
