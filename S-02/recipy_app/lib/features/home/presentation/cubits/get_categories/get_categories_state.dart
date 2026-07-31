import 'package:equatable/equatable.dart';
import 'package:recipy_app/features/home/domian/entities/category.entity.dart';

sealed class GetCategoriesState extends Equatable {
  const GetCategoriesState();
}

final class GetCategoriesInitial extends GetCategoriesState {
  @override
  List<Object> get props => [];
}

// GET ALL SHIPMENTS
final class GetCategoriesLoading extends GetCategoriesState {
  @override
  List<Object> get props => [];
}

final class GetCategoriesSuccess extends GetCategoriesState {
  final List<CategoryEntity> categories;
  const GetCategoriesSuccess({required this.categories});
  @override
  List<Object> get props => [];
}

final class GetCategoriesFailure extends GetCategoriesState {
  final String errorMessage;
  const GetCategoriesFailure({required this.errorMessage});
  @override
  List<Object> get props => [];
}
