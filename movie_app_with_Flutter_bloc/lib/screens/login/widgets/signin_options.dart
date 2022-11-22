import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:movies_app_with_bloc/constents.dart';

class SigninOptions extends StatelessWidget {
  const SigninOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: kmarginRL15,
          padding: kpadding8,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(10)),
          child: SignInButton(
            Buttons.FacebookNew,
            elevation: 0,
            padding: kpadding8,
            text: "Continue with Facebook",
            onPressed: () {},
          ),
        ),
        kheight10,
        Container(
          margin: kmarginRL15,
          padding: kpadding8,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SignInButton(
            Buttons.Google,
            elevation: 0,
            padding: kpadding8,
            text: "Continue with Google",
            onPressed: () {},
          ),
        ),
        kheight10,
        Container(
          margin: kmarginRL15,
          padding: kpadding8,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: SignInButton(
            Buttons.AppleDark,
            elevation: 0,
            padding: kpadding8,
            text: "Continue with Apple",
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
