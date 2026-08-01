import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/cach_exception.dart';
import 'package:recipy_app/core/errors/error_handler.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/errors/server_exception.dart';
import 'package:recipy_app/features/home/data/data_sources/local/get_categories_local_datasource.impl.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_remote_datasource.impl.dart';
import 'package:recipy_app/features/home/data/models/category_model.dart';
import 'package:recipy_app/features/home/domian/entities/category.entity.dart';
import 'package:recipy_app/features/home/domian/repos/get_categories.repo.dart';

class GetCategoriesRepoImpl implements ICategoriesRepo {
  final GetCategoriesRemoteDataSourceImpl remote;
  final GetCategoriesLocalDataSourceImpl local;

  GetCategoriesRepoImpl({required this.remote, required this.local});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      List<CategoryModel> remoteData = await remote.getCategories();
      await local.cacheCategories(categories: remoteData);
      return right(remoteData);
    } on ServerException catch (e) {
      try {
        List<CategoryModel> localData = await local.getCachedCategories();
        List<CategoryEntity> entities = localData;
        return right(entities);
      } on CacheException {
        final handler = HandleError.handle(e.exception);
        return left(handler);
      }
    }
  }
}
