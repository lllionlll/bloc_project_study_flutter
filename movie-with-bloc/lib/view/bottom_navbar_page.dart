import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app_bloc/view/profile_page.dart';
import 'package:movie_app_bloc/view/tvseries_home_page.dart';

import '../constants/app_icons.dart';
import '../constants/app_radius.dart';
import '../constants/app_text.dart';
import 'movies_home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlert = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    getConnectivity();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isAlert == false) {
        _dialogBuilder();
        setState(() => isAlert = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const [
            MoviesHomePage(),
            TvSeriesHomePage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            title: Text(BottomNavBarPageText.moviesText),
            icon: Icon(BottomNavBarPageIcons.movieIcon),
          ),
          BottomNavyBarItem(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            title: Text(BottomNavBarPageText.tvSeriesText),
            icon: Icon(BottomNavBarPageIcons.tvSeriesIcon),
          ),
          BottomNavyBarItem(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
            title: Text(BottomNavBarPageText.profileText),
            icon: Icon(BottomNavBarPageIcons.profileIcon),
          )
        ],
      ),
    );
  }

  Future<void> _dialogBuilder() {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(MovieListPageRadius.normalValue)),
          title: Text(NetworkCheckerText.content),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlert = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  _dialogBuilder();
                  setState(() {
                    isAlert = true;
                  });
                }
              },
              child: Text(
                NetworkCheckerText.buttonText,
              ),
            ),
          ],
        );
      },
    );
  }
}
