import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:recipy_app/core/services/api_services.dart';
import 'package:recipy_app/features/home/data/data_sources/local/get_categories_local_datasource.impl.dart';
import 'package:recipy_app/features/home/data/data_sources/local/get_categories_meals_local_datasource.impl.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_meals_remote_datasource.impl.dart';
import 'package:recipy_app/features/home/data/data_sources/remote/get_categories_remote_datasource.impl.dart';
import 'package:recipy_app/features/home/data/models/category_model.dart';
import 'package:recipy_app/features/home/data/models/meal_model.dart';
import 'package:recipy_app/features/home/data/models/meals_cache_model.dart';
import 'package:recipy_app/features/home/data/repos/get_categories.repo_impl.dart';
import 'package:recipy_app/features/home/data/repos/get_categories_meals.repo_impl.dart';
import 'package:recipy_app/features/home/domian/use_cases/get_categories.usecase.dart';
import 'package:recipy_app/features/home/domian/use_cases/get_categories_meals.usecase.dart';
import 'package:recipy_app/features/meal_details/data/data_sources/remote/get_meal_details_remote_datasource.impl.dart';
import 'package:recipy_app/features/meal_details/data/repos/get_meal_details_repo.impl.dart';
import 'package:recipy_app/features/meal_details/domain/use_cases/get_meal_details.usecase.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // * HIVE SETUP
  try {
    await Hive.initFlutter();

    // ADAPTERS
    Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
    Hive.registerAdapter<MealModel>(MealModelAdapter());

    Hive.registerAdapter<MealsCacheModel>(MealsCacheModelAdapter());

    // BOXES
    final Box<CategoryModel> categoriesBox = await Hive.openBox<CategoryModel>(
      'categoriesBox',
    );
    final Box<MealsCacheModel> mealsBox = await Hive.openBox<MealsCacheModel>(
      'mealsBox',
    );

    // * API SERVICES
    getIt.registerSingleton<ApiServices>(ApiServices());

    // *  CATEGORIES PART
    getIt.registerSingleton<GetCategoriesRemoteDataSourceImpl>(
      GetCategoriesRemoteDataSourceImpl(api: getIt<ApiServices>()),
    );

    getIt.registerSingleton<GetCategoriesLocalDataSourceImpl>(
      GetCategoriesLocalDataSourceImpl(categoriesBox: categoriesBox),
    );

    getIt.registerSingleton<GetCategoriesRepoImpl>(
      GetCategoriesRepoImpl(
        remote: getIt.get<GetCategoriesRemoteDataSourceImpl>(),
        local: getIt.get<GetCategoriesLocalDataSourceImpl>(),
      ),
    );

    getIt.registerSingleton<GetCategoriesUseCase>(
      GetCategoriesUseCase(repo: getIt.get<GetCategoriesRepoImpl>()),
    );

    // *  MEALS PART
    getIt.registerSingleton<GetCategoryMealsRemoteDataSourceImpl>(
      GetCategoryMealsRemoteDataSourceImpl(api: getIt<ApiServices>()),
    );

    getIt.registerSingleton<GetCategoriesMealsLocalDataSourceImpl>(
      GetCategoriesMealsLocalDataSourceImpl(mealsBox: mealsBox),
    );

    getIt.registerSingleton<GetCategoryMealsRepoImpl>(
      GetCategoryMealsRepoImpl(
        remote: getIt.get<GetCategoryMealsRemoteDataSourceImpl>(),
        local: getIt.get<GetCategoriesMealsLocalDataSourceImpl>(),
      ),
    );

    getIt.registerSingleton<GetCategoryMealsUseCase>(
      GetCategoryMealsUseCase(repo: getIt.get<GetCategoryMealsRepoImpl>()),
    );

    // * MEAL DETAILS PART
    getIt.registerSingleton<GetMealDetailsRemoteDataSourceImpl>(
      GetMealDetailsRemoteDataSourceImpl(api: getIt<ApiServices>()),
    );

    getIt.registerSingleton<GetMealDetailsRepoImpl>(
      GetMealDetailsRepoImpl(
        remote: getIt.get<GetMealDetailsRemoteDataSourceImpl>(),
      ),
    );

    getIt.registerSingleton<GetMealDetailsUseCase>(
      GetMealDetailsUseCase(repo: getIt.get<GetMealDetailsRepoImpl>()),
    );
  } catch (error, trace) {
    Logger().w(error);
    Logger().i(trace);
  }
}
