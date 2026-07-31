import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/services/use_case.dart';
import 'package:recipy_app/features/home/domian/entities/category.entity.dart';
import 'package:recipy_app/features/home/domian/repos/get_categories.repo.dart';

class GetCategoriesUseCase extends UseCase<List<CategoryEntity>, NoParams> {
  final ICategoriesRepo repo;

  GetCategoriesUseCase({required this.repo});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repo.getCategories();
  }
}
