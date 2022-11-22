import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/domain/entities/cast_member.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class CastCardWidget extends StatelessWidget {
  final CastMember castMember;
  const CastCardWidget({super.key, required this.castMember});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 154,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl:
                        ApiConstants.getPosterPath(castMember.profilePath!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  castMember.name!,
                  style: Theme.of(context).textTheme.vulcanBodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 5.0),
                child: Text(
                  castMember.character!,
                  style: Theme.of(context).textTheme.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
