import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/models/category_model.dart';
import 'package:recipy_app/core/models/meal_model.dart';

abstract class IMealsRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();

  Future<Either<Failure, List<MealModel>>> getCategoryMeals({String? category});
}
