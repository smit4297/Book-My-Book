import 'package:bookbook/app_screens/home_screen.dart';
import 'package:bookbook/app_screens/initialPages/auth_provider.dart';
import 'package:bookbook/app_screens/initialPages/login_screen.dart';
import 'package:bookbook/app_screens/profile.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'intro_screen.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus{
  notSignedIn,
  signedIn,
  //notDetermined,
}

class _RootPageState extends State<RootPage> {


  //AuthStatus authStatus = AuthStatus.notDetermined;
  AuthStatus authStatus = AuthStatus.notSignedIn;

  // @override
  // initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget.auth.currentUser().then((userId){
  //     setState(() {
  //       authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
  //     });

  //   });
  // }

  void didChangeDependencies(){
    super.didChangeDependencies();
    final BaseAuth auth = AuthProvider.of(context).auth;
    auth.currentUser().then((String userId){
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
      
    });
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

    void _signedOut(){
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      // case AuthStatus.notDetermined:
      // return _buildWaitingScreen();

      case AuthStatus.notSignedIn:
      return new MyHomePage(
        auth: widget.auth,
        onSignedIn: _signedIn,
      );

      case AuthStatus.signedIn:
      return MyApp(
        auth: widget.auth,
        onSignedOut: _signedOut,
      );


      
      
      // new Scaffold(
      //   body: new Container(child: Text('Hello',style: TextStyle(fontSize: 15),),)
      // );
    }
  }

  // Widget _buildWaitingScreen(){
  //   return Scaffold(body: Container(child: CircularProgressIndicator(),),);
  // }
}