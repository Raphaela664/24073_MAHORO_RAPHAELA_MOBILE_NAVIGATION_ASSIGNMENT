import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/background.jpeg'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Center(child: Text('RM', style: TextStyle(fontSize: 26))),
                ),
                SizedBox(height: 20),
                Text(
                  "Raoul Mozart",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home, size: 26, color: Colors.black),
            title: Text('Home', style: TextStyle(fontSize: 26)),
          ),
          // Add more ListTile items for other menu options
          // Remember to implement their onTap functionalities
        ],
      ),
    );
  }
}
