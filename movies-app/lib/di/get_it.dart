import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_app/data/data_sources/language_local_data_source.dart';
import 'package:movies_app/data/data_sources/movies_local_data_source.dart';
import 'package:movies_app/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/data/data_sources/theme_local_data_source.dart';
import 'package:movies_app/data/repositories/language_repository_impl.dart';
import 'package:movies_app/data/repositories/movies_repository_impl.dart';
import 'package:movies_app/data/repositories/theme_repository_impl.dart';
import 'package:movies_app/domain/repositories/language_repository.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import 'package:movies_app/domain/repositories/theme_repository.dart';
import 'package:movies_app/domain/usecases/delete_favorite_movie_usecase.dart';
import 'package:movies_app/domain/usecases/get_all_favorite_movies_usecase.dart';
import 'package:movies_app/domain/usecases/get_movie_cast_members_usecase.dart';
import 'package:movies_app/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/domain/usecases/get_movie_videos_usecase.dart';
import 'package:movies_app/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/domain/usecases/get_preferred_language_usecase.dart';
import 'package:movies_app/domain/usecases/get_preferred_theme_mode_usecase.dart';
import 'package:movies_app/domain/usecases/get_search_movies_usecase.dart';
import 'package:movies_app/domain/usecases/get_trending_movies_usecase.dart';
import 'package:movies_app/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movies_app/domain/usecases/is_favorite_movie_exists_usecase.dart';
import 'package:movies_app/domain/usecases/save_favorite_movie_usecase.dart';
import 'package:movies_app/domain/usecases/save_preferred_language_usecase.dart';
import 'package:movies_app/domain/usecases/save_preferred_theme_mode_usecase.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_videos/movie_videos_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_backdrop/movies_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_carousel/movies_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_favorite/movies_favorite_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_search/movies_search_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_tabs/movies_tabs_bloc.dart';
import 'package:movies_app/presentation/blocs/theme_mode/theme_mode_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getItInstance = GetIt.instance;

Future<void> init() async {
  getItInstance.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  getItInstance.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl());
  getItInstance.registerLazySingleton<MoviesLocalDatasource>(
      () => MoviesLocalDataSourceImpl());
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());
  getItInstance.registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSourceImp(sharedPreferences: getItInstance()));
  getItInstance.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(getItInstance(), getItInstance()));
  getItInstance.registerLazySingleton<LanguangeRepository>(
      () => LanguageRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(getItInstance()));

//////////////////////////////////////// UseCases /////////////////////////////////////////////////
  getItInstance.registerLazySingleton<GetTrendingMoviesUsecase>(
      () => GetTrendingMoviesUsecase(getItInstance()));
  getItInstance.registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(getItInstance()));
  getItInstance.registerLazySingleton<GetNowPlayingMoviesUsecase>(
      () => GetNowPlayingMoviesUsecase(getItInstance()));
  getItInstance.registerLazySingleton<GetUpcomingMoviesUsecase>(
      () => GetUpcomingMoviesUsecase(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetailsUsecase>(
      () => GetMovieDetailsUsecase(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieCastMembersUsecase>(
      () => GetMovieCastMembersUsecase(moviesRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetMovieVideowUsecase>(
      () => GetMovieVideowUsecase(moviesRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetSearchMoviesUsecase>(
      () => GetSearchMoviesUsecase(getItInstance()));
  ////////////////////////////////////////////
  getItInstance.registerLazySingleton<SaveFavoriteMovieUsecase>(
      () => SaveFavoriteMovieUsecase(getItInstance()));
  getItInstance.registerLazySingleton<DeleteFavoriteMovieUsecase>(
      () => DeleteFavoriteMovieUsecase(getItInstance()));

  getItInstance.registerLazySingleton<IsFavoriteMovieExistsUsecase>(
      () => IsFavoriteMovieExistsUsecase(getItInstance()));

  getItInstance.registerLazySingleton<GetAllFavoriteMoviesUsecase>(
      () => GetAllFavoriteMoviesUsecase(getItInstance()));

  ////////////////////////////////////////////
  getItInstance.registerLazySingleton<GetPreferredLanguageUsecase>(
      () => GetPreferredLanguageUsecase(getItInstance()));
  getItInstance.registerLazySingleton<SavePreferredLanguageUsecase>(
      () => SavePreferredLanguageUsecase(getItInstance()));
  /////////////////////////////////////////////
  getItInstance.registerLazySingleton<SavePreferredThemeModeUsecase>(
      () => SavePreferredThemeModeUsecase(getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredThemeModeUsecase>(
      () => GetPreferredThemeModeUsecase(getItInstance()));

/////////////////////////////////////// Blocs //////////////////////////////////////////////////
  getItInstance.registerFactory<MoviesBackdropBloc>(() => MoviesBackdropBloc());

  getItInstance.registerFactory<MoviesCarouselBloc>(() => MoviesCarouselBloc(
        getTrendingMoviesUsecase: getItInstance(),
        moviesBackdropBloc: getItInstance(),
        loadingBloc: getItInstance(),
      ));

  getItInstance.registerFactory<MoviesTabsBloc>(() => MoviesTabsBloc(
        getNowPlayingMoviesUsecase: getItInstance(),
        getPopularMoviesUsecase: getItInstance(),
        getUpcomingMoviesUsecase: getItInstance(),
      ));

  getItInstance.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(
        getMovieDetailsUsecase: getItInstance(),
        movieCastBloc: getItInstance(),
        movieVideosBloc: getItInstance(),
        moviesFavoriteBloc: getItInstance(),
        loadingBloc: getItInstance(),
      ));

  getItInstance.registerFactory<MovieCastBloc>(
      () => MovieCastBloc(getMovieCastMembersUsecase: getItInstance()));

  getItInstance.registerFactory<MovieVideosBloc>(() => MovieVideosBloc(
        getMovieVideowUsecase: getItInstance(),
      ));

  getItInstance.registerFactory<MoviesSearchBloc>(
      () => MoviesSearchBloc(searchMoviesUsecase: getItInstance()));

  getItInstance.registerFactory<MoviesFavoriteBloc>(() => MoviesFavoriteBloc(
        saveFavoriteMovieUsecase: getItInstance(),
        deleteFavoriteMovieUsecase: getItInstance(),
        isFavoriteMovieExistsUsecase: getItInstance(),
        getAllFavoriteMoviesUsecase: getItInstance(),
        loadingBloc: getItInstance(),
      ));

  ///////////////////////////
  getItInstance.registerSingleton<ThemeModeBloc>(ThemeModeBloc(
    getItInstance(),
    getItInstance(),
  ));

  getItInstance.registerSingleton<LoadingBloc>(LoadingBloc());

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc(
    getPreferredLanguageUsecase: getItInstance(),
    savePreferredLanguageUsecase: getItInstance(),
  ));
}
