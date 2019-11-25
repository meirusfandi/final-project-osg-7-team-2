import 'package:final_project_osg7/ui/home/about_us.dart';
import 'package:final_project_osg7/ui/home/dashboard.dart';
import 'package:final_project_osg7/ui/home/notifications.dart';
import 'package:final_project_osg7/ui/home/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // set properties
  int _currentIndex = 0;
  final List<Widget> _children = [
        Dashboard(),
        SearchMeals(),
        AboutUs()
  ];

  // set default / active tab
  Widget _currentScreen = Dashboard();
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: _bucket,
        child: _currentScreen,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 32,
        ),
        backgroundColor: Colors.lightBlue,
        onPressed: (){},
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _currentScreen = Dashboard();
                    _currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home, 
                      color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                      ) 
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _currentScreen = SearchMeals();
                    _currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search, 
                      color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      'Search Meals',
                      style: TextStyle(
                        color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                      ) 
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _currentScreen = Notifications();
                    _currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.notifications, 
                      color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                      ) 
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _currentScreen = AboutUs();
                    _currentIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person, 
                      color: _currentIndex == 3 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                        color: _currentIndex == 3 ? Colors.blue : Colors.grey,
                      ) 
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}