// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_useCase.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters(this.movieId);

  @override
  List<Object> get props => [movieId];
}
