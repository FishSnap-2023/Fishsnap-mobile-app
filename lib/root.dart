import 'package:fishsnap/home.dart';
import 'package:fishsnap/profile.dart';
import 'package:fishsnap/scan.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';


class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomNavIndex = 0;
  //list of the pages
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];

  //list of the pages icons
  List<BottomNavigationBarItem> bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  //list of the page titles
  List<String> appBarTitles = const [
    'Home',
    'Profile',
  ];
  //function to change the page
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),

            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop)
          );
        },
        backgroundColor: Colors.blue,
        child: Image.asset(
          'assets/images/scan.png',
          width: 30,
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor:const Color.fromARGB(255, 17, 118, 212),
        activeColor: const Color.fromARGB(255, 17, 118, 212),
        inactiveColor: Colors.black.withOpacity(0.5),
        icons: const [
          Icons.home,
          Icons.person,
        ],
        activeIndex: bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => bottomNavIndex = index),
      ),
    );
  }
}