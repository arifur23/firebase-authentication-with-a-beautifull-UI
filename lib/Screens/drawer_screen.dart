import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:firebase_authentication/Screens/login_screen.dart';
import 'package:firebase_authentication/classes/applicationState.dart';
import 'package:firebase_authentication/constants.dart';
import 'package:firebase_authentication/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;


  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, child) =>
            Material(
              child: FancyDrawerWrapper(
                  backgroundColor: Colors.white,
                  cornerRadius:  20,
                  controller: _controller,
                  drawerItems:  <Widget>[
                    GestureDetector(
                      onTap: (){
                        // appState.signOut();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Profile",
                        style: drawerItemStyle,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // appState.signOut();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Settings",
                        style: drawerItemStyle,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // appState.signOut();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "History",
                        style: drawerItemStyle,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // appState.signOut();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Support us",
                        style: drawerItemStyle,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        appState.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Log Out",
                        style: drawerItemStyle,
                      ),
                    ),
                  ],
                  child: Scaffold(
                    appBar: AppBar(
                      elevation: 4.0,
                      centerTitle: true,
                      title: const Text(
                        "New App Bar",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        icon: const Icon(
                          Icons.menu_open_sharp,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _controller.toggle();
                        },
                      ),
                    ),
                    body:  Center(
                      child: _widgetOptions.elementAt(_selectedIndex),
                    ),
                    bottomNavigationBar: SalomonBottomBar(
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                      items: [
                        /// Home
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.home),
                          title: const Text("Home"),
                          selectedColor: Colors.purple,
                        ),

                        /// Likes
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.favorite_border),
                          title: const Text("Likes"),
                          selectedColor: Colors.purple,
                        ),

                        /// Search
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.search),
                          title: const Text("Search"),
                          selectedColor: Colors.purple,
                        ),

                        /// Profile
                        SalomonBottomBarItem(
                          icon: const Icon(Icons.person),
                          title: const Text("Profile"),
                          selectedColor: Colors.purple,
                        ),
                      ],
                    ),
                  )
              ),
            )
    );
  }
}