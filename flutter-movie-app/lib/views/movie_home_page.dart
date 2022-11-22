import 'package:flutter/material.dart';
import 'package:movie_app/views/trending_movies_page.dart';
import 'package:movie_app/views/popular_movies_page.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            height: 40,
            color: Theme.of(context).primaryColor,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Mega Cine',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          actions: const [],
          bottom: TabBar(
              labelStyle: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'Poppins',
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(child: Text('Popular')),
                Tab(child: Text('Trending'))
              ]),
        ),
        body: const TabBarView(children: [
          PopularMoviesPage(),
          TrendingMoviesPage(),
        ]),
      ),
    );
  }
}
