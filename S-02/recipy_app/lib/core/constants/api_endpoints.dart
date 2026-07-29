class ApiEndpoints {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  static const String getCategories = '/categories.php';

  static const String getCategoryMeals = '/filter.php?c={category}';
}
