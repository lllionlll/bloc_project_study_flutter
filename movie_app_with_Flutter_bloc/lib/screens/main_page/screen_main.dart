import 'package:flutter/material.dart';
import 'package:movies_app_with_bloc/screens/app_screens/home_screen.dart';
import 'package:movies_app_with_bloc/screens/main_page/widgets/bottom_nav.dart';
import 'package:movies_app_with_bloc/screens/profile_page/profile_screen.dart';
import 'package:movies_app_with_bloc/screens/search_page/search_screen.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
