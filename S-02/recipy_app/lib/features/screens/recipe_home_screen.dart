import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/core/models/category_model.dart';
import 'package:recipy_app/core/repos/meals_repo_impl.dart';
import 'package:recipy_app/features/cubits/get_meals/get_meals_cubit.dart';
import 'package:recipy_app/features/cubits/get_meals/get_meals_state.dart';
import 'package:recipy_app/features/widgets/custom_app_bar.dart';
import 'package:recipy_app/features/widgets/custom_bottom_nav_bar.dart';
import 'package:recipy_app/features/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MealsRepoImpl _mealsRepo = MealsRepoImpl();

  late Future<Either<Failure, List<CategoryModel>>> _categoriesFuture;

  String _selectedCategory = 'Seafood';
  int _currentNavIndex = 1;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _mealsRepo.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetMealsCubit(repo: _mealsRepo)
            ..getCategoryMeals(category: _selectedCategory),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 227, 227),
        appBar: CustomAppBar(
          title: _selectedCategory,
          onMenuPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Menu tapped')));
          },
          onProfilePressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Profile tapped')));
          },
        ),
        body: Column(
          children: [
            // ---- Categories ----
            SizedBox(
              height: 50,
              child: FutureBuilder<Either<Failure, List<CategoryModel>>>(
                future: _categoriesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (!snapshot.hasData) {
                    return const SizedBox.shrink();
                  }

                  return snapshot.data!.fold(
                    (failure) => Center(
                      child: Text(
                        failure.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    (categories) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          final isSelected =
                              category.strCategory == _selectedCategory;

                          return ChoiceChip(
                            label: Text(category.strCategory ?? ''),
                            selected: isSelected,
                            onSelected: (_) {
                              if (category.strCategory != null &&
                                  category.strCategory != _selectedCategory) {
                                setState(() {
                                  _selectedCategory = category.strCategory!;
                                });
                                context.read<GetMealsCubit>().getCategoryMeals(
                                  category: _selectedCategory,
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            // ---- Meals Grid (Cubit) ----
            Expanded(
              child: BlocBuilder<GetMealsCubit, GetMealsState>(
                builder: (context, state) {
                  switch (state) {
                    case GetMealsInitial():
                    case GetMealsLoading():
                      return const Center(child: CircularProgressIndicator());

                    case GetMealsFailure():
                      return Center(child: Text(state.errorMessage));

                    case GetMealsSuccess():
                      final meals = state.meals;
                      if (meals.isEmpty) {
                        return const Center(child: Text('No meals found'));
                      }

                      return GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.72,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: meals.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(
                            meal: meals[index],
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Selected: ${meals[index].strMeal}',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _currentNavIndex,
          onItemTapped: (index) {
            setState(() {
              _currentNavIndex = index;
            });
          },
        ),
      ),
    );
  }
}
