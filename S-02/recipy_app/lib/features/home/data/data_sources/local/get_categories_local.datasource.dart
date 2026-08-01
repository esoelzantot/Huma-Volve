import 'package:recipy_app/features/home/data/models/category_model.dart';

abstract class GetCategoriesLocalDataSource {
  Future<void> cacheCategories({required List<CategoryModel> categories});

  Future<List<CategoryModel>> getCachedCategories();

  Future<void> clearCachedCategories();
}
