import 'package:hive_flutter/adapters.dart';
import 'package:recipy_app/features/home/data/models/meal_model.dart';

part 'meals_cache_model.g.dart';

@HiveType(typeId: 2)
class MealsCacheModel {
  @HiveField(0)
  final List<MealModel> meals;

  MealsCacheModel({required this.meals});
}
