import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_bloc/models/cast.dart';
import 'package:movies_app_with_bloc/screens/app_screens/genre_card.dart';

import '../bloc/genres/genres_bloc.dart';
import '../models/movie.dart';

class Genress extends StatelessWidget {
  const Genress({
    Key? key,
    required this.kDefaultPadding,
    required this.movie,
  }) : super(key: key);

  final double kDefaultPadding;
  final Result movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<GenresBloc>(context).add(GetGenresDetails(movie.id!));
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: size.height / 20,
        child: BlocBuilder<GenresBloc, GenresState>(
          builder: (context, state) {
            log('state is $state');
            if (state is GenresLoaded) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.genresList!.length,
                  itemBuilder: (context, index) => Genrescard(
                        gnere: state.genresList![index].name,
                      ));
            }
            if (state is GenresFailed) {
              print(state.errorGenresText);
            }
            if (state is GenresInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Container(
                child: Center(
                    child: Text(
                  "No Genres Available",
                  style: TextStyle(color: Colors.grey[500]),
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
