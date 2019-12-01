import 'package:final_project_osg7/ui/home/about_us.dart';
import 'package:final_project_osg7/ui/home/dashboard.dart';
import 'package:final_project_osg7/ui/home/favorite.dart';
import 'package:final_project_osg7/ui/home/notifications.dart';
import 'package:final_project_osg7/ui/home/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // set properties
  int _currentIndex = 0;
  final List<Widget> _children = [
        DashboardScreen(),
        SearchMealsScreen(),
        FavoriteScreen(),
        AboutUsScreen()
  ];

  // set default / active tab
  Widget _currentScreen = DashboardScreen();
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: _bucket,
        child: _currentScreen,
      ),

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
                    _currentScreen = DashboardScreen();
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
                    _currentScreen = SearchMealsScreen();
                    _currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search, 
                      color: _currentIndex == 1 ? Colors.green : Colors.grey,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: _currentIndex == 1 ? Colors.green : Colors.grey,
                      ) 
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  showToast('Favorite Menu Not Available now !', duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                  setState(() {
                    _currentScreen = FavoriteScreen();
                    _currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: _currentIndex == 2 ? Colors.red : Colors.grey,
                      size: 32,
                    ),
                    Text(
                      'Favorite',
                      style: TextStyle(
                        color: _currentIndex == 2 ? Colors.red : Colors.grey,
                      ) 
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _currentScreen = AboutUsScreen();
                    _currentIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person, 
                      color: _currentIndex == 3 ? Colors.yellow : Colors.grey,
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                        color: _currentIndex == 3 ? Colors.yellow : Colors.grey,
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

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
  
}