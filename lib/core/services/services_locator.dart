import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_reposetory.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/det_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendaion_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controllers/bloc/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controllers/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));



    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
