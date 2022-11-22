import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_with_bloc/screens/app_screens/home_screen.dart';
import 'package:movies_app_with_bloc/constents.dart';
import 'package:movies_app_with_bloc/screens/widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email;
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
                    "Sign up",
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
                        SizedBox(
                          width: 300,
                          child: Text(
                            "Looks like you don't have an account. \nLet's Create a  new account ...",
                            style: GoogleFonts.combo(
                                textStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                        kheight20,
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
                              email = value;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              hintText: "Email",
                              hoverColor: Colors.purple.shade900,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        kheight10,
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
                        Text(
                          "By selecting Agree and continue  below,",
                          style: GoogleFonts.combo(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "  I agree to",
                              style: GoogleFonts.combo(
                                  textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            Text(
                              "Terms of  Service and Privacy Policy",
                              style: GoogleFonts.combo(
                                  textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ],
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
                            // log(email);
                            // log(password);
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              }
                            } on FirebaseAuthException catch (e) {
                              // print("#############");
                              // print(e);
                              // print("#############");
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
                          name: "Agree and continue",
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
