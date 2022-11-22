import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_bloc/models/movie.dart';

import '../bloc/cast/cast_bloc.dart';
import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final String movieId;
  const CastAndCrew({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CastBloc>(context).add(GetCastDetailes(movieId));
    double kDefaultPadding = 20.0;
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast & Crew',
            style: TextStyle(color: Colors.grey[700], fontSize: 25),
          ),
          SizedBox(height: kDefaultPadding / 2),
          SizedBox(
            // decoration: BoxDecoration(color: Colors.blueAccent),
            height: 160,
            child: BlocBuilder<CastBloc, CastState>(
              builder: (context, state) {
                log(state.toString());
                if (state is Castloaded) {
                  return ListView.builder(
                      itemCount: state.castList.length - 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          CastCard(cast: state.castList[index]));
                }
                if (state is CastInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CastFailed) {
                  print(state.errorCastText);
                  return Container();
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
