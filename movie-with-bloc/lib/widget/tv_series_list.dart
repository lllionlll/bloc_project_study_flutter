import 'package:flutter/material.dart';
import 'package:movie_app_bloc/model/tvseries_model.dart';
import 'package:movie_app_bloc/view/tv_series_details_page.dart';

import '../constants/app_api.dart';
import '../constants/app_padding.dart';
import '../constants/app_radius.dart';

class TvSeriesList extends StatelessWidget {
  const TvSeriesList({
    super.key,
    required this.title,
    required this.tvSeriesDetailsList,
  });
  final String title;
  final List<TvSeriesResult>? tvSeriesDetailsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: AppPadding.maximumValue, left: AppPadding.normalValue),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvSeriesDetailsList?.length ?? 0,
              itemBuilder: ((context, index) {
                var movieList = tvSeriesDetailsList?[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MovieHomePagePadding.normalValue,
                      horizontal: MovieHomePagePadding.minimumValue),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.all(MovieHomePagePadding.minimumValue),
                        child: Text(
                          movieList?.name ?? "",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TvSeriesDetailsPage(
                                  id: movieList?.id.toString() ?? ""),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              MovieListPageRadius.highValue),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: FadeInImage.assetNetwork(
                              placeholder: "lib/assets/images/placeholder.png",
                              image: ApiConst.posterPath +
                                  (movieList?.posterPath ?? ""),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Image.asset(
                                      "lib/assets/images/placeholder.png"),
                                );
                              },
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
        )
      ],
    );
  }
}
