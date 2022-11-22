import 'package:flutter/material.dart';
import 'package:movies_app_with_bloc/constents.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onpressed;
  const CustomButton({
    Key? key,
    required this.onpressed,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: kmarginRL15,
      padding: kpadding8,
      decoration: BoxDecoration(
          color: Colors.purple.shade700,
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: onpressed,
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
