import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app_with_bloc/screens/app_screens/home_screen.dart';
import 'package:movies_app_with_bloc/constents.dart';
import 'package:movies_app_with_bloc/screens/login/login.dart';
import 'package:movies_app_with_bloc/screens/main_page/screen_main.dart';
import 'package:movies_app_with_bloc/screens/widgets/custom_button.dart';

class Loginpass extends StatefulWidget {
  const Loginpass({super.key});

  @override
  State<Loginpass> createState() => _LoginpassState();
}

class _LoginpassState extends State<Loginpass> {
  late String password;
  final _auth = FirebaseAuth.instance;
  bool _showpassword = false;

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
              bottom: 100,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Log in",
                    style: GoogleFonts.combo(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.black45.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        kheight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Lottie.asset(
                              movielogo,
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                            ),
                            kwidth10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   'User Name',
                                //   style: GoogleFonts.combo(
                                //       textStyle: const TextStyle(
                                //           fontSize: 20,
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.bold)),
                                // ),
                                kwidth10,
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    email!,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.combo(
                                        textStyle: const TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        kheight50,
                        Container(
                          padding: kpadding8,
                          margin: kmarginRL15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            // textAlign: TextAlign.center,
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: !_showpassword,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 15),
                              hintText: "Password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(
                                        () => _showpassword = !_showpassword);
                                  },
                                  icon: Icon(
                                      _showpassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: _showpassword
                                          ? Colors.blue
                                          : Colors.grey)),
                              hoverColor: Colors.purple.shade900,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        kheight20,
                        CustomButton(
                          onpressed: () async {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(
                                      child: CircularProgressIndicator(),
                                    ));
                            try {
                              final newUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email!.trim(),
                                      password: password.trim());
                              if (newUser != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ScreenMainPage()));
                              }
                            } on FirebaseAuthException catch (e) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text(e.code),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          name: "Continue",
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 15),
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
