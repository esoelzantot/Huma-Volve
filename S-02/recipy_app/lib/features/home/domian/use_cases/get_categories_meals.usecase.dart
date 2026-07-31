import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/services/use_case.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';
import 'package:recipy_app/features/home/domian/repos/get_categories_meals.repo.dart';

class GetCategoryMealsUseCase extends UseCase<List<MealEntity>, String> {
  final IMealsRepo repo;

  GetCategoryMealsUseCase({required this.repo});

  @override
  Future<Either<Failure, List<MealEntity>>> call([String category = '']) async {
    return await repo.getCategoryMeals(category: category);
  }
}
