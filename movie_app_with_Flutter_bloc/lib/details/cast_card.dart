// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:movies_app_with_bloc/models/cast.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double kDefaultPadding = 20.0;
    return FadeInRight(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          // decoration: BoxDecoration(color: Colors.blue),
          margin: EdgeInsets.only(right: kDefaultPadding),
          width: size.width / 5,
          child: Column(
            children: [
              Container(
                height: size.height / 11,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(cast.profilePath != null
                            ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath!}'
                            : 'https://cdn-icons-png.flaticon.com/512/149/149071.png'))),
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                cast.name.toString(),
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black87),
              ),
              SizedBox(
                height: kDefaultPadding / 4,
              ),
              Text(
                cast.character.toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
