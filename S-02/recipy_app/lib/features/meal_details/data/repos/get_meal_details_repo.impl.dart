import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipy_app/core/errors/error_handler.dart';
import 'package:recipy_app/core/errors/failure.dart';
import 'package:recipy_app/features/meal_details/data/data_sources/remote/get_meal_details_remote_datasource.impl.dart';
import 'package:recipy_app/features/meal_details/domain/entities/meal_details_entity.dart';
import 'package:recipy_app/features/meal_details/domain/repos/get_meal_details.repo.dart';

class GetMealDetailsRepoImpl implements IMealDetailsRepo {
  final GetMealDetailsRemoteDataSourceImpl remote;

  GetMealDetailsRepoImpl({required this.remote});

  @override
  Future<Either<Failure, MealDetailsEntity>> getMealDetails({
    required String id,
  }) async {
    // TODO: implement getMealDetails
    try {
      MealDetailsEntity remoteData = await remote.getMealDetails(id: id);
      return right(remoteData);
    } on DioException catch (e) {
      final failure = HandleError.handle(e);
      return left(failure);
    }
  }
}
