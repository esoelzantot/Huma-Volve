import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_categories/get_categories_cubit.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_categories/get_categories_state.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_meals/get_meals_cubit.dart';
import 'package:recipy_app/features/home/presentation/cubits/get_meals/get_meals_state.dart';
import 'package:recipy_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:recipy_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:recipy_app/features/home/presentation/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Seafood';
  int _currentNavIndex = 1;

  @override
  void initState() {
    super.initState();
    context.read<GetCategoriesCubit>().getCategories();
    context.read<GetMealsCubit>().getCategoryMeals(category: _selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GetCategoriesCubit>().getCategories();
          context.read<GetMealsCubit>().getCategoryMeals(
            category: _selectedCategory,
          );
        },
        child: Column(
          children: [
            // ---- Categories ----
            SizedBox(
              height: 50,
              child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
                builder: (context, state) {
                  switch (state) {
                    case GetCategoriesInitial():
                    case GetCategoriesLoading():
                      return const Center(child: CircularProgressIndicator());

                    case GetCategoriesFailure():
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );

                    case GetCategoriesSuccess():
                      final categories = state.categories;
                      if (categories.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          final isSelected = category.name == _selectedCategory;

                          return ChoiceChip(
                            label: Text(category.name),
                            selected: isSelected,
                            onSelected: (_) {
                              if (category.name != _selectedCategory) {
                                setState(() {
                                  _selectedCategory = category.name;
                                });
                                context.read<GetMealsCubit>().getCategoryMeals(
                                  category: _selectedCategory,
                                );
                              }
                            },
                          );
                        },
                      );
                  }
                },
                buildWhen: (previous, current) =>
                    current is GetCategoriesSuccess ||
                    current is GetCategoriesFailure ||
                    current is GetCategoriesLoading,
              ),
            ),

            // ---- Meals Grid ----
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
                                    'Selected: ${meals[index].name}',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                  }
                },
                buildWhen: (previous, current) =>
                    current is GetMealsSuccess ||
                    current is GetMealsFailure ||
                    current is GetMealsLoading,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentNavIndex,
        onItemTapped: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }
}
