import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movies_backdrop/movies_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_carousel/movies_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_search/movies_search_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_tabs/movies_tabs_bloc.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movies_app/presentation/journeys/home/carousel/movies_carousel_widget.dart';
import 'package:movies_app/presentation/journeys/home/movies_tabs/movies_tabs_widget.dart';
import 'package:movies_app/presentation/widgets/app_error.wiget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesCarouselBloc moviesCarouselBloc;
  late MoviesBackdropBloc moviesBackdropBloc;
  late MoviesTabsBloc moviesTabsBloc;
  late MoviesSearchBloc moviesSearchBloc;
  @override
  void initState() {
    super.initState();
    moviesCarouselBloc = getItInstance();
    moviesCarouselBloc.add(const MoviescarouselLoadEvent(defaultIndex: 0));
    moviesBackdropBloc = moviesCarouselBloc.moviesBackdropBloc;
    moviesTabsBloc = getItInstance();
    moviesSearchBloc = getItInstance();
  }

  @override
  void dispose() {
    print("Home screen dispoooooosed");
    moviesCarouselBloc.close();
    moviesBackdropBloc.close();
    moviesTabsBloc.close();
    moviesSearchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //BlocProvider<MoviesCarouselBloc>(create: (ctx) => moviesCarouselBloc),
          //BlocProvider<MoviesBackdropBloc>(create: (ctx) => moviesBackdropBloc),
          BlocProvider<MoviesCarouselBloc>.value(value: moviesCarouselBloc),
          BlocProvider<MoviesBackdropBloc>.value(value: moviesBackdropBloc),
          BlocProvider<MoviesTabsBloc>.value(value: moviesTabsBloc),
          BlocProvider<MoviesSearchBloc>.value(value: moviesSearchBloc),
        ],
        child: Scaffold(
          drawer: const NavigationDrawer(),
          body: BlocBuilder<MoviesCarouselBloc, MoviesCarouselState>(
            bloc: moviesCarouselBloc,
            builder: (context, state) {
              if (state is MoviesCarouselLoadedState) {
                //TODO: Handle if returned movies list is empty
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MoviesCarouselWidget(
                        movies: state.carouselMovies,
                        defaultIndex: state.defaultIndex,
                      ),
                    ),
                    const FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: MoviesTabsWidget(),
                    ),
                  ],
                );
              } else if (state is MoviesCarouselErrorState) {
                return AppErrorWidget(
                  errorType: state.errorType,
                  handleRetryPress: () {
                    moviesCarouselBloc
                        .add(const MoviescarouselLoadEvent(defaultIndex: 0));
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
