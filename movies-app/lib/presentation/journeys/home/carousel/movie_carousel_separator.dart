import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

class MovieCarouselSeparator extends StatelessWidget {
  const MovieCarouselSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 80,
      padding: const EdgeInsets.only(top: 2, bottom: 6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        gradient: LinearGradient(
          colors: [Appcolors.violet, Appcolors.royalBlue],
        ),
      ),
    );
  }
}
