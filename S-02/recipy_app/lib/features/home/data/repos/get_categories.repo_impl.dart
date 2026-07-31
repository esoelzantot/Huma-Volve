import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipy_app/core/errors/error_handler.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_remote_datasource.impl.dart';
import 'package:recipy_app/features/home/domian/entities/category.entity.dart';
import 'package:recipy_app/features/home/domian/repos/get_categories.repo.dart';

class GetCategoriesRepoImpl implements ICategoriesRepo {
  final GetCategoriesRemoteDataSourceImpl remote;

  GetCategoriesRepoImpl({required this.remote});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      List<CategoryEntity> remoteData = await remote.getCategories();
      return right(remoteData);
    } on DioException catch (e) {
      final failure = HandleError.handle(e);
      return left(failure);
    }
  }
}
