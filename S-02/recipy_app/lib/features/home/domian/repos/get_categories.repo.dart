import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/features/home/domian/entities/category.entity.dart';

abstract class ICategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
