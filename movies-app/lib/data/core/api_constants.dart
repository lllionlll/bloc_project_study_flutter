class ApiConstants {
  ApiConstants._(); // Private constructor, can't get instance of it

  static const API_KEY = "f03b091ad9c78bbc2450cc4e84caa068";
  static const BASE_URL = "https://api.themoviedb.org/3/";
  static String getPosterPath(String posterPath) =>
      "https://image.tmdb.org/t/p/w500$posterPath";
//////////////////////////////////// Movies /////////////////////////////////////////

  static const TRENDING_MOVIES_URL =
      "${BASE_URL}trending/movie/day?api_key=$API_KEY";
  static const UPCOMING_MOVIES_URL =
      "${BASE_URL}movie/upcoming?api_key=$API_KEY";
  static const POPULAR_MOVIES_URL = "${BASE_URL}movie/popular?api_key=$API_KEY";
  static const NOW_PLAYING_MOVIES_URL =
      "${BASE_URL}movie/now_playing?api_key=$API_KEY";
  static String getMoviesSearchUrl(Map<String, dynamic> queries) {
    String query = '';
    queries.forEach((key, value) {
      //if (value != null)
      query += '&$key=$value';
    });
    return '${BASE_URL}search/movie?api_key=$API_KEY$query';
  }

////////////////////////////////// Movie///////////////////////////////////////////
  static String getMovieDetailsUrl(int movieId) =>
      "${BASE_URL}movie/$movieId?api_key=$API_KEY";
  static String getMovieCastUrl(int movieId) =>
      "${BASE_URL}movie/$movieId/credits?api_key=$API_KEY";
  static String getMovieVideosUrl(int movieId) =>
      "${BASE_URL}movie/$movieId/videos?api_key=$API_KEY";
}
