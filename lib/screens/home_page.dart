import 'package:flutter/material.dart';
import 'package:shramikaya/screens/jobs_page.dart';
import 'package:shramikaya/screens/notifications_page.dart';
import 'package:shramikaya/screens/profile_page.dart';
import 'package:shramikaya/screens/wishlist_page.dart';
import 'package:shramikaya/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 0;
  //Screeen List
  List<Widget> pagesList = [
    JobsPage(),
    WishListPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        currentIndex: navIndex,
        selectedItemColor: secondaryColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda_rounded),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_rounded),
            label: "Wish List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
      body: Scaffold(
        body: Container(
          child: pagesList[navIndex],
        ),
      ),
    );
  }
}
