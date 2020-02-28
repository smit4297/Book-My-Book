import 'package:bookbook/app_screens/addtocart.dart';
import 'package:bookbook/app_screens/displayproduct/categories.dart';
import 'package:bookbook/app_screens/initialPages/auth.dart';
import 'package:bookbook/app_screens/profile.dart';
import 'package:bookbook/app_screens/uploadproduct.dart';
import 'package:flutter/material.dart';
import 'package:bookbook/app_screens/first_screen.dart';

class MyApp extends StatefulWidget {
  //MyApp({this.auth, this.onSignedOut});
  final VoidCallback onSignedOut;
  const MyApp({Key key, this.onSignedOut, this.auth});
  final BaseAuth auth;
 

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    element(),
    ProductList(),
    AddProduct(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 30,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              title: Text('Add'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ));
  }
}
