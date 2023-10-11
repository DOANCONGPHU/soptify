
import 'package:flutter/material.dart';
import 'package:soptify/view/explore.dart';
import 'package:soptify/view/home.dart';
import 'package:soptify/view/library.dart';
import 'package:soptify/view/people.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedIndex = 0;
    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } 
  static const _widgetOptions = <Widget>[
    HomeView(),
    ExploreView(),
    LibraryView(),
    ProfileView()

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "Library",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "People",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex]
      ),
    );
  }
}