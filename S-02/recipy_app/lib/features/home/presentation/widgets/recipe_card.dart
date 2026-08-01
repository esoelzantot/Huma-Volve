import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipy_app/core/constants/app_colors.dart';
import 'package:recipy_app/features/home/domian/entities/meal.entity.dart';
import 'package:recipy_app/features/meal_details/presentation/cubits/get_meal_details_cubit.dart';
import 'package:recipy_app/features/meal_details/presentation/views/meal_details_screen.dart';

class RecipeCard extends StatelessWidget {
  final MealEntity meal;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  const RecipeCard({
    super.key,
    required this.meal,
    this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GetMealDetailsCubit>(
          context,
        ).getMealDetails(id: meal.id);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealDetailsScreen(meal: meal),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe Image with Favorite Badge Overlay
          Stack(
            children: [
              // Image Container
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1.1,
                  child: CachedNetworkImage(
                    imageUrl: meal.image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(
                        Icons.restaurant,
                        color: AppColors.primaryBrown,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Recipe Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(
              meal.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Meal {
  String idMeal;
  String strMeal;
  String strMealThumb;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });
}
