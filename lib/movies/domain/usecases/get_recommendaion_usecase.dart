import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_useCase.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUsecase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
