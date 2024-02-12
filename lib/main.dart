import 'package:flutter/material.dart';
import 'package:navigation_assignment/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HamburgerMenu(),
    );
  }
}

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mail App'),
      backgroundColor: Colors.blue,
      ),
      drawer: Drawer(child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('images/background.jpeg'))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: Center(child: Text('RM',style: TextStyle(fontSize: 26))),
                ),
                SizedBox(height: 20,),
                Text("Raoul Mozart", style: TextStyle(color: Colors.white, fontSize: 26),)
              ],
            )),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()),);
              },
              leading: Icon(Icons.home, size: 26, color: Colors.black,),
              title: Text('Home',style: TextStyle(fontSize: 26)),

            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.search, size: 26, color: Colors.black,),
              title: Text('search',style: TextStyle(fontSize: 26)),

            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.inbox_outlined, size: 26, color: Colors.black,),
              title: Text('Inbox',style: TextStyle(fontSize: 26)),

            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.notifications, size: 26, color: Colors.black,),
              title: Text('Notifications',style: TextStyle(fontSize: 26)),

            ),
            Divider(color: Colors.black,),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.settings, size: 26, color: Colors.black,),
              title: Text('Settings',style: TextStyle(fontSize: 26)),

            )
        ],
      )),
      body: Container(),
    );
  }
}
