import 'package:flutter/material.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';

import '../themes/theme_color.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function() handlePress;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.handlePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Appcolors.violet, Appcolors.royalBlue],
        ),
      ),
      child: TextButton(
        onPressed: handlePress,
        child: Text(
          text.translate(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
