import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';

abstract class IMealDetailsRepo {
  Future<Either<Failure, MealDetailsEntity>> getMealDetails({
    required String id,
  });
}
