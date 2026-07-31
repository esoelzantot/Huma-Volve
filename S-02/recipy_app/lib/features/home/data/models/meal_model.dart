import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';

class MealModel extends MealEntity {
  String? idMeal;
  String? strMeal;
  String? strMealThumb;
  String? strArea;
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
