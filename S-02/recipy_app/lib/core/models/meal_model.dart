class MealModel {
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
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    strArea = json['strArea'];
    strCountry = json['strCountry'];
  }
}
