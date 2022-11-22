import 'package:flutter/material.dart';
import 'package:movies_app_with_bloc/screens/app_screens/body.dart';
import 'package:movies_app_with_bloc/screens/app_screens/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _navigatorKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _navigatorKey,
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      drawer: const MainDrawer(),
      body: const Body(),
    );
  }

  // appbar
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // menu icon
      leading: IconButton(
        padding: const EdgeInsets.only(left: 20),
        icon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset('assets/images/menu.png'),
        ),
        onPressed: () {
          // Scaffold.of(context).openDrawer();
          _navigatorKey.currentState!.openDrawer();
        },
      ),
      // Search icon
      // actions: [
      //   IconButton(
      //       padding: const EdgeInsets.only(right: 20),
      //       onPressed: () {},
      //       icon: Image.asset('assets/images/search.png'))
      // ],
    );
  }
}
