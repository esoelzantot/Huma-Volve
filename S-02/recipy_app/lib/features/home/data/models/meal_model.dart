import 'package:hive_flutter/adapters.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 1)
class MealModel extends MealEntity {
  @HiveField(0)
  String? idMeal;
  @HiveField(1)
  String? strMeal;
  @HiveField(2)
  String? strMealThumb;
  @HiveField(3)
  String? strArea;
  @HiveField(4)
  String? strCountry;

  MealModel({
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
    this.strArea,
    this.strCountry,
  }) : super(name: strMeal!, image: strMealThumb!, id: idMeal!);

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
    idMeal: json['idMeal'],
    strMeal: json['strMeal'],
    strMealThumb: json['strMealThumb'],
    strArea: json['strArea'],
    strCountry: json['strCountry'],
  );
}
