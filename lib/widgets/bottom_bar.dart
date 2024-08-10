import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';
import 'package:mentor4u_app/screens/home_screen.dart';
import 'package:mentor4u_app/screens/message_screen.dart';
import 'package:mentor4u_app/screens/profile_screen.dart';
import 'package:mentor4u_app/screens/search_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottomBar';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pagesIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    const SearchScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];
  void togglePages(int page) {
    setState(() {
      _pagesIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const ImageIcon(AssetImage(chatGptLogo)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pagesIndex,
        onTap: togglePages,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_outlined,
              size: 18,
            ),
            label: 'Home',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.messenger_outline),
            label: 'Messages',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_pin),
            label: 'Profile',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: pages[_pagesIndex],
    );
  }
}
