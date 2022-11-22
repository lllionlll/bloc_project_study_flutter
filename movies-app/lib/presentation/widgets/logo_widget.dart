import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  const LogoWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(
        'assets/pngs/logo.png',
        color: Theme.of(context).colorScheme.secondary,
        //fit: BoxFit.fitHeight,
      ),
    );
  }
}
