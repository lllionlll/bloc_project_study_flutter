import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/model/movie_model.dart';
import 'package:movie_app_bloc/model/actor_details_model.dart';
import 'package:movie_app_bloc/services/cubit/movie_cubit.dart';
import 'package:movie_app_bloc/view/movie_details_page.dart';
import 'package:movie_app_bloc/widget/error_widget.dart';
import 'package:movie_app_bloc/widget/is_loading.dart';

import '../constants/app_api.dart';
import '../constants/app_padding.dart';
import '../constants/app_radius.dart';
import '../constants/app_text.dart';
import '../widget/spacer_widget.dart';

class ActorDetailsPage extends StatelessWidget {
  const ActorDetailsPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getActorDetails(id),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MovieLoading) {
              return const IsLoading();
            } else if (state is GetActorDetailsState) {
              var data = state.actorDetailsItem;
              var movieHistory = state.movieHistoryList;
              return _buildActorInfo(context, data, movieHistory);
            } else {
              return const ErrorPage(error: "ERROR",);
            }
          },
        ),
      ),
    );
  }

  SingleChildScrollView _buildActorInfo(BuildContext context,
      ActorDetailsModel? data, List<Results>? movieHistory) {
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
                    ApiConst.posterPath + (data?.profilePath ?? ""),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MoviePagePaddig.minimumValue,
                  right: MoviePagePaddig.minimumValue,
                  top: MoviePagePaddig.normalValue),
              child: Column(
                children: [
                  Text(
                    data?.name ?? "",
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
                  SpacerWidget(pageContext: context, coefficient: 0.05),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ActorDetailsPageText.biography,
                        style: Theme.of(context).textTheme.headline4,
                      )),
                  SpacerWidget(pageContext: context, coefficient: 0.02),
                  Text(
                    data?.biography ?? "",
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
                        itemCount: movieHistory?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.all(MoviePagePaddig.minimumValue),
                            child: Column(
                              children: [
                                Text(
                                  movieHistory?[index].title ?? "",
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
                                          builder: (context) =>
                                              MovieDetailsPage(
                                                  movieId: movieHistory?[index]
                                                          .id
                                                          .toString() ??
                                                      "")),
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
                                          (movieHistory?[index].posterPath ??
                                              ""),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Center(
                                          child: Image.asset(
                                              "lib/assets/images/placeholder.png"),
                                        );
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