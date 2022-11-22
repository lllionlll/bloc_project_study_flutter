import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget(
      {super.key, required this.pageContext, required this.coefficient});
  final BuildContext pageContext;
  final double coefficient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(pageContext).size.height * coefficient,
    );
  }
}
