
import 'package:flutter/material.dart';
import 'package:flutter_first/ui/contacts.dart';
import 'package:flutter_first/ui/profile.dart';
import 'home_page.dart';
import 'location.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    LocationPage(),
    ProfilePage(),
    Contacts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //var _unselectedItemColor = Colors.white30;
    Color unselectedItemColor = Colors.black;
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.location_city),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contacts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: unselectedItemColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

