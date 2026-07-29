import 'package:equatable/equatable.dart';
import 'package:recipy_app/core/models/meal_model.dart';

sealed class GetMealsState extends Equatable {
  const GetMealsState();
}

final class GetMealsInitial extends GetMealsState {
  @override
  List<Object> get props => [];
}

// GET ALL SHIPMENTS
final class GetMealsLoading extends GetMealsState {
  @override
  List<Object> get props => [];
}

final class GetMealsSuccess extends GetMealsState {
  final List<MealModel> meals;
  const GetMealsSuccess({required this.meals});
  @override
  List<Object> get props => [];
}

final class GetMealsFailure extends GetMealsState {
  final String errorMessage;
  const GetMealsFailure({required this.errorMessage});
  @override
  List<Object> get props => [];
}
