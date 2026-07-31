import 'package:recipy_app/features/meal_details/data/models/ingredient_model.dart';
import 'package:recipy_app/features/meal_details/domain/entities/ingredient_entity.dart';
import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';

class MealDetailsModel extends MealDetailsEntity {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strCountry;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;

  MealDetailsModel({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strCountry,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required List<IngredientEntity> ingredientsList,
  }) : super(
         id: idMeal!,
         name: strMeal!,
         category: strCategory!,
         area: strArea!,
         country: strCountry,
         instructions: strInstructions ?? '',
         thumbnail: strMealThumb!,
         tags: (strTags != null && strTags.trim().isNotEmpty)
             ? strTags.split(',').map((e) => e.trim()).toList()
             : const [],
         youtubeUrl: strYoutube,
         ingredients: ingredientsList,
       );

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {
    final ingredients = <IngredientModel>[];

    for (var i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredients.add(
          IngredientModel(
            name: ingredient.toString().trim(),
            measure: (measure ?? '').toString().trim(),
          ),
        );
      }
    }

    return MealDetailsModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strCountry: json['strCountry'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      ingredientsList: ingredients,
    );
  }
}
