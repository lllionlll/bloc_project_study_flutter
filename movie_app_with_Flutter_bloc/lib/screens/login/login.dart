import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_with_bloc/constents.dart';
import 'package:movies_app_with_bloc/screens/login/login_pass.dart';
import 'package:movies_app_with_bloc/screens/login/widgets/signin_options.dart';
import 'package:movies_app_with_bloc/screens/sign_up/sign_up.dart';
import 'package:movies_app_with_bloc/screens/widgets/custom_button.dart';

String? email;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  // bool isValid = EmailValidator.validate(email ?? '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //bg statrting
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Image.asset(
                    "assets/images/famtv.jpg",
                    fit: BoxFit.cover,
                  ),
                  //  Lottie.asset(logInImage),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                ),
              ],
            ), //bg end
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Log in",
                    style: GoogleFonts.combo(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.black45.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        kheight50,
                        Container(
                          padding: kpadding8,
                          margin: kmarginRL15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            onChanged: (value) {
                              email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     alert(context);
                            //   }
                            //   return null;
                            // },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              hintText: "Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        kheight20,
                        CustomButton(
                          onpressed: () {
                            if (email == null || email!.isEmpty) {
                              final snackBar = SnackBar(
                                content: const Text('Please Enter Valid Email'),
                                action: SnackBarAction(
                                  label: 'ok',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            // else if (isValid = false) {
                            //   const snackBar1 = SnackBar(
                            //     content: Text('Please Enter Valid Email'),
                            //   );
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(snackBar1);
                            // }
                            else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Loginpass()));
                            }
                          },
                          name: "Continue",
                        ),
                        kheight10,
                        const Text("OR"),
                        kheight10,
                        const SigninOptions(),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 15),
                              child: Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: GoogleFonts.combo(
                                    textStyle: const TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 15),
                              child: Text(
                                "Forgot your password?",
                                style: GoogleFonts.combo(
                                  textStyle: const TextStyle(
                                    color: Colors.purple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
