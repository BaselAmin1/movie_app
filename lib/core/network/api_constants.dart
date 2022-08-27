class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '87cba2468980fb7908f581d3d83be964';

  static const String nowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviePath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviePath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetailsPath(int movieId)=>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationPath(int movieId)=>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
