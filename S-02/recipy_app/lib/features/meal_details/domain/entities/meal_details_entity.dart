import 'package:recipy_app/features/meal_details/domain/entities/ingredient_entity.dart';

class MealDetailsEntity {
  final String id;
  final String name;
  final String category;
  final String area;
  final String? country;
  final String instructions;
  final String thumbnail;
  final List<String> tags;
  final String? youtubeUrl;
  final List<IngredientEntity> ingredients;

  MealDetailsEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    this.country = '',
    required this.instructions,
    required this.thumbnail,
    required this.tags,
    this.youtubeUrl = '',
    required this.ingredients,
  });
}
