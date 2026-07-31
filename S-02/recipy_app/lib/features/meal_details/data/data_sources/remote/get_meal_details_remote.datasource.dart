import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';

abstract class GetMealDetailsRemoteDataSource {
  Future<MealDetailsEntity> getMealDetails({required String id});
}
