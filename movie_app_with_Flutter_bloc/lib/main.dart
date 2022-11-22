import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_bloc/bloc/cast/cast_bloc.dart';
import 'package:movies_app_with_bloc/bloc/genres/genres_bloc.dart';
import 'package:movies_app_with_bloc/bloc/movies/movies_bloc.dart';
import 'package:movies_app_with_bloc/bloc/videos/videos_bloc.dart';
import 'package:movies_app_with_bloc/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_with_bloc/screens/main_page/screen_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(create: (context) => MoviesBloc()),
        BlocProvider<GenresBloc>(create: (context) => GenresBloc()),
        BlocProvider<CastBloc>(create: (context) => CastBloc()),
        BlocProvider<VideosBloc>(create: (context) => VideosBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // const Loginpage(),
            StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Somthing went worng',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return ScreenMainPage();
                  } else {
                    return const Loginpage();
                  }
                }),
      ),
    );
  }
}
