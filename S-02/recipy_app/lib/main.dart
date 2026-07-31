import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/core/services/services_locator.dart';
import 'package:recipy_app/features/home/domian/use_cases/get_categories.usecase.dart';
import 'package:recipy_app/features/home/domian/use_cases/get_categories_meals.usecase.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_categories/get_categories_cubit.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_meals/get_meals_cubit.dart';
import 'package:recipy_app/features/home/presentation/views/recipe_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetCategoriesCubit(useCase: getIt.get<GetCategoriesUseCase>()),
        ),

        BlocProvider(
          create: (context) =>
              GetMealsCubit(useCase: getIt.get<GetCategoryMealsUseCase>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 226, 227, 227),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 148, 76, 17),
          surface: const Color.fromARGB(255, 226, 227, 227),
        ),
        fontFamily: 'Roboto',
      ),
      // home: const SeafoodScreen(),
      home: HomeScreen(),
    );
  }
}
