import 'package:hive/hive.dart';
import 'package:recipy_app/core/errors/cach_exception.dart';
import 'package:recipy_app/features/home/data/data_sources/local/get_categories_local.datasource.dart';
import 'package:recipy_app/features/home/data/models/category_model.dart';

class GetCategoriesLocalDataSourceImpl implements GetCategoriesLocalDataSource {
  final Box<CategoryModel> categoriesBox;
  GetCategoriesLocalDataSourceImpl({required this.categoriesBox});

  @override
  Future<void> cacheCategories({
    required List<CategoryModel> categories,
  }) async {
    // TODO: implement cacheCategories
    await categoriesBox.clear();
    await categoriesBox.addAll(categories);
  }

  @override
  Future<void> clearCachedCategories() async {
    // TODO: implement clearCachedCategories
    await categoriesBox.clear();
  }

  @override
  Future<List<CategoryModel>> getCachedCategories() async {
    // TODO: implement getCachedCategories

    final categories = categoriesBox.values.toList();
    if (categories.isEmpty) {
      throw CacheException(message: 'No cached categories found');
    }
    return categories;
  }
}
