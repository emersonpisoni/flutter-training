import 'package:dog/pages/random_dog.page.dart';
import 'package:dog/pages/search_dog.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List _content = [
    SearchDogPage(),
    RandomDogPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Paw City'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.1),
                      BlendMode.dstIn,
                    ),
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/paw.jpg'))),
            child: Center(
              child: _content.elementAt(_selectedIndex),
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search for breed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Pic of the day')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
