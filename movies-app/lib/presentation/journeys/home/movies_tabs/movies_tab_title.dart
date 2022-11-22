import 'package:flutter/material.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

class MoviesTabTitle extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback handeSelection;

  const MoviesTabTitle({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.handeSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: handeSelection,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: isSelected ? Appcolors.royalBlue : Colors.transparent,
              ),
            ),
          ),
          child: Text(title.translate(context)),
        ),
      );
    });
  }
}
