import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_bloc/constents.dart';
import 'package:movies_app_with_bloc/models/movie.dart';
import 'package:movies_app_with_bloc/screens/search_page/widgets/tilte.dart';

import '../../../bloc/movies/movies_bloc.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviesBloc>(context).add(GetCarouselMovies());
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTitle(
              title: 'Top Search',
            ),
            kheight10,
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              // width: double.infinity,
              height: 588,
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  log(state.toString());
                  if (state is MoviesLoaded) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TopSearchTile(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500/${state.movieList.results![index].posterPath!}',
                            title:
                                state.movieList.results![index].originalTitle!);
                      },
                      separatorBuilder: (context, index) => kheight20,
                      itemCount: state.movieList.results!.length,
                    );
                  }
                  if (state is MoviesFailed) {
                    log(state.errorText);
                  }
                  if (state is MoviesInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopSearchTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchTile({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.35,
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageUrl))),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(
            title,
            style: const TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
          // const CircleAvatar(
          //   backgroundColor: kWhiteColor,
          //   radius: 25,
          const CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 25,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kWhiteColor,
              ),
            ),
            // ),
          )
        ],
      ),
    );
  }
}
