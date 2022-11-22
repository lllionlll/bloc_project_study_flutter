import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/routes.dart';

class GridViewMovie extends StatelessWidget {
  const GridViewMovie(
      {super.key,
      required this.maxWidth,
      required this.maxHeight,      
      required this.movie, this.scrollController} 
     );
  
  final double maxWidth;
  final double maxHeight;
  final ScrollController? scrollController;
  final List movie;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: maxWidth ~/ 130,
            childAspectRatio: 9 / 18),
        controller: scrollController,
        itemCount: movie.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.movieDetail,
              arguments: movie[index].id,
              
            );
          },
          child: GridTile(
            header: Image.network(
              Constants.urlImagePoster + movie[index].posterPath,
              fit: BoxFit.cover,
            ),
            footer: Text(
              movie[index].title,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            child: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
