import 'package:assignment_3/CalculatorView.dart';
import 'package:assignment_3/authentication/login_page.dart';
import 'package:assignment_3/provider/theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'InternetConnectivity/internet_connectivity.dart';
import 'Inbox.dart';
import 'Notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0; 

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final List<Widget> _pages = [
    LoginPage(),
    CalculatorView(),
    InboxPageWidget(),
    NotificationsPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, 
      appBar: AppBar(
        title: Text(
          'Mail App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          
        ),
        actions:<Widget> [
          IconButton(
             icon: Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed: (){
              ThemeProvider themeProvider = Provider.of<ThemeProvider> (context, listen: false);
              themeProvider.swaTheme();

            },
          )
         
        ],
      ),
      drawer: Drawer(
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
                  Text("Raoul Mozart", style: TextStyle(color: Colors.white, fontSize: 26)),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                _selectPage(0);
              },
              leading: Icon(Icons.home, size: 26, color: Colors.black),
              title: Text('Home', style: TextStyle(fontSize: 26)),
            ),
            ListTile(
              onTap: () {
                _selectPage(1);
              },
              leading: Icon(Icons.calculate, size: 26, color: Colors.black),
              title: Text('calculate', style: TextStyle(fontSize: 26)),
            ),
            ListTile(
              onTap: () {
                _selectPage(2);
              },
              leading: Icon(Icons.inbox_outlined, size: 26, color: Colors.black),
              title: Text('Inbox', style: TextStyle(fontSize: 26)),
            ),
            ListTile(
              onTap: () {
                _selectPage(3);
              },
              leading: Icon(Icons.notifications, size: 26, color: Colors.black),
              title: Text('Notifications', style: TextStyle(fontSize: 26)),
            ),
            Divider(color: Colors.black),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings, size: 26, color: Colors.black),
              title: Text('Settings', style: TextStyle(fontSize: 26)),
            ),
          ],
        ),
      ),
  
  //    body: _pages[_selectedIndex],
   body: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ConnectivityResult result = snapshot.data!;
            if (result == ConnectivityResult.none) {
              return  internet_connectivity();
            } else {
              internet_connectivity();
              return _pages[_selectedIndex];
            }
          } else {
            // You can display a loading spinner here if needed
            return CircularProgressIndicator();
          }
        },
      ),
      
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.calculate,
                text: 'Calc',
              ),
              GButton(
                icon: Icons.inbox,
                text: 'Inbox',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
  

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); 
  }
}


class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home', style: TextStyle(fontSize: 30)),
    );
  }
}


