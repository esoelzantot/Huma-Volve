import 'package:equatable/equatable.dart';
import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';

sealed class GetMealDetailsState extends Equatable {
  const GetMealDetailsState();
}

final class GetMealDetailsInitial extends GetMealDetailsState {
  @override
  List<Object> get props => [];
}

// GET ALL SHIPMENTS
final class GetMealDetailsLoading extends GetMealDetailsState {
  @override
  List<Object> get props => [];
}

final class GetMealDetailsSuccess extends GetMealDetailsState {
  final MealDetailsEntity meal;
  const GetMealDetailsSuccess({required this.meal});
  @override
  List<Object> get props => [];
}

final class GetMealDetailsFailure extends GetMealDetailsState {
  final String errorMessage;
  const GetMealDetailsFailure({required this.errorMessage});
  @override
  List<Object> get props => [];
}
