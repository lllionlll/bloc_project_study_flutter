import 'package:flutter/material.dart';

class ReloadStateButton extends StatelessWidget {
  const ReloadStateButton({
    Key? key,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  final double size;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size / 6,
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      splashColor: Theme.of(context).colorScheme.background,
      icon: const Icon(
        Icons.refresh,
      ),
    );
  }
}
