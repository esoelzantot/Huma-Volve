import 'package:flutter/material.dart';
import 'package:recipy_app/core/constants/app_colors.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';
import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';
import 'package:recipy_app/features/meal_details/presentation/widgets/category_area_chip.dart';
import 'package:recipy_app/features/meal_details/presentation/widgets/ingredients_section.dart';
import 'package:recipy_app/features/meal_details/presentation/widgets/instructions_section.dart';
import 'package:recipy_app/features/meal_details/presentation/widgets/meal_details_sliver_app_bar.dart';

class MealDetailsSuccessView extends StatelessWidget {
  final MealEntity initialMeal;
  final MealDetailsEntity mealDetail;

  const MealDetailsSuccessView({
    super.key,
    required this.initialMeal,
    required this.mealDetail,
  });

  @override
  Widget build(BuildContext context) {
    final title = mealDetail.name;
    final image = mealDetail.thumbnail;

    return CustomScrollView(
      slivers: [
        MealDetailsSliverAppBar(title: title, imageUrl: image),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),

                // Category & Area Badges
                Row(
                  children: [
                    if (mealDetail.name!.isNotEmpty)
                      CategoryAreaChip(
                        icon: Icons.restaurant_menu_rounded,
                        label: mealDetail.name,
                      ),
                    if (mealDetail.name.isNotEmpty &&
                        mealDetail.area.isNotEmpty)
                      const SizedBox(width: 8),
                    if (mealDetail.area.isNotEmpty)
                      CategoryAreaChip(
                        icon: Icons.public_rounded,
                        label: mealDetail.area,
                      ),
                  ],
                ),
                const SizedBox(height: 24),

                // Ingredients Section
                IngredientsSection(ingredients: mealDetail.ingredients),

                // Instructions Section
                InstructionsSection(instructions: mealDetail.instructions),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
