import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utlis/enums.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendaion_usecase.dart';
import 'package:movie_app/movies/presentation/controllers/bloc/movie_details_state.dart';
part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviesDetailsUsecase, this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMoviesDetailsUseCase getMoviesDetailsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMoviesDetailsUsecase(MovieDetailsParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetails: r, movieDetailsState: RequestState.loaded)));
  }

  FutureOr<void> _getRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUsecase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendation: r, recommendationState: RequestState.loaded)));
  }
}
