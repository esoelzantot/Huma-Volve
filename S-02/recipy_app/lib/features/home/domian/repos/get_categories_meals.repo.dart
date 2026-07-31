import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';

abstract class IMealsRepo {
  Future<Either<Failure, List<MealEntity>>> getCategoryMeals({
    String? category,
  });
}
