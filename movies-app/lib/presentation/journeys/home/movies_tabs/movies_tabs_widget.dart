import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/movies_tabs/movies_tabs_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movies_tabs/tab_constatnts.dart';
import 'package:movies_app/presentation/journeys/loading/loading_circle_widget.dart';
import 'package:movies_app/presentation/widgets/app_error.wiget.dart';

import 'movies_tab_title.dart';
import 'movies_tabs_horizontal_list_view.dart';

class MoviesTabsWidget extends StatefulWidget {
  const MoviesTabsWidget({super.key});

  @override
  State<MoviesTabsWidget> createState() => _MoviesTabsWidgetState();
}

class _MoviesTabsWidgetState extends State<MoviesTabsWidget> {
  MoviesTabsBloc get _moviesTabsBloc =>
      BlocProvider.of<MoviesTabsBloc>(context);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _moviesTabsBloc.add(ChangeMoviesTabEvent(tabIndex: _currentIndex));
  }

  @override
  void dispose() {
    _moviesTabsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesTabsBloc, MoviesTabsState>(builder: (ctx, state) {
      if (state is MovieTabsLoadingState) {
        return const Center(child: LoadingCircleWidget(size: 200));
      } else if (state is MoviesTabsLoadedState) {
        _currentIndex = state.currentTabIndex;
        //TODO: Handle if returned movies list is empty
        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < TabConstants.movieTabs.length; i++)
                    MoviesTabTitle(
                      title: TabConstants.movieTabs[i].title,
                      isSelected: TabConstants.movieTabs[i].index ==
                              state.currentTabIndex
                          ? true
                          : false,
                      handeSelection: () => _handeTabSelection(i),
                    ),
                ],
              ),
              Expanded(
                child: MoviesTabsHorizontalListView(movies: state.movies),
              ),
            ],
          ),
        );
      } else if (state is MoviesTabsErrorState) {
        return AppErrorWidget(
          errorType: state.errorType,
          handleRetryPress: () {
            _moviesTabsBloc.add(ChangeMoviesTabEvent(tabIndex: _currentIndex));
          },
        );
      }
      return const SizedBox.shrink();
    });
  }

  void _handeTabSelection(int tabIndex) {
    _moviesTabsBloc.add(ChangeMoviesTabEvent(tabIndex: tabIndex));
  }
}
