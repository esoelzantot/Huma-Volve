import 'package:dartz/dartz.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/services/use_case.dart';
import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';
import 'package:recipy_app/features/meal_details/domain/repos/get_meal_details.repo.dart';

class GetMealDetailsUseCase extends UseCase<MealDetailsEntity, String> {
  final IMealDetailsRepo repo;

  GetMealDetailsUseCase({required this.repo});

  @override
  Future<Either<Failure, MealDetailsEntity>> call([String id = '']) async {
    return await repo.getMealDetails(id: id);
  }
}
