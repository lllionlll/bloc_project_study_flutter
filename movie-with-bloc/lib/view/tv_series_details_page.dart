import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/services/cubit/movie_cubit.dart';
import 'package:movie_app_bloc/widget/is_loading.dart';

import '../constants/app_api.dart';
import '../constants/app_padding.dart';
import '../constants/app_radius.dart';
import '../model/tvseries_actor_model.dart';
import '../widget/error_widget.dart';
import '../widget/spacer_widget.dart';
import 'actor_details_page.dart';

class TvSeriesDetailsPage extends StatelessWidget {
  const TvSeriesDetailsPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getTvSeriesDetails(id),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print("Beğenilenlere Eklendi id:$id");
                }
              },
              icon: const Icon(Icons.favorite_outline),
            ),
          ],
        ),
        body: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MovieLoading) {
              return const IsLoading();
            } else if (state is GetTvSeriesDataState) {
              var data = state.tvSeriesDetailsModel;
              return _tvSeriesDetailsWidget(
                  context, data, state.tvSeriesActorModel);
            } else {
              return const ErrorPage(error: "Error");
            }
          },
        ),
      ),
    );
  }

  SingleChildScrollView _tvSeriesDetailsWidget(BuildContext context,
      Map<String, dynamic>? data, List<TvSeriesActorModel>? actorList) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(MovieDetailsPageRadius.posterValue),
                bottomRight:
                    Radius.circular(MovieDetailsPageRadius.posterValue),
              ),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    fit: BoxFit.fill,
                    ApiConst.posterPath + (data?["poster_path"] ?? ""),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MoviePagePaddig.minimumValue,
                  vertical: MoviePagePaddig.normalValue),
              child: Column(
                children: [
                  Text(
                    data?["name"] ?? "No Name",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SpacerWidget(
                    pageContext: context,
                    coefficient: 0.02,
                  ),
                  // _buildGenresBox(context, data),
                  SpacerWidget(pageContext: context, coefficient: 0.05),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Overview",
                        style: Theme.of(context).textTheme.headline4,
                      )),
                  SpacerWidget(pageContext: context, coefficient: 0.02),
                  Text(
                    data?["overview"],
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  SpacerWidget(pageContext: context, coefficient: 0.05),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: actorList?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.all(MoviePagePaddig.minimumValue),
                            child: Column(
                              children: [
                                Text(
                                  actorList?[index].name ?? "No Name Found",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ActorDetailsPage(
                                            id: actorList?[index]
                                                    .id
                                                    .toString() ??
                                                ""),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          "lib/assets/images/placeholder.png",
                                      image: ApiConst.posterPath +
                                          (actorList?[index].profilePath ?? ""),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Center(
                                            child: Image.asset(
                                                "lib/assets/images/placeholder.png"));
                                      },
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
