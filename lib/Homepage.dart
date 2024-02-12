import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20
          ),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor:Colors.white,
            tabBackgroundColor: Colors.grey.shade800 ,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                ),
              GButton(
                icon: Icons.inbox,
                text: 'Inbox',
                ),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications',
                ),
            ]
            ),
        ),
      ),
    );
  }
}

