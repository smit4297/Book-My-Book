import 'package:bookbook/app_screens/home_screen.dart';
import 'package:bookbook/app_screens/initialPages/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookbook/app_screens/initialPages/root_page.dart';
import 'package:bookbook/app_screens/initialPages/auth.dart';

import 'app_screens/initialPages/auth_provider.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  return runApp(AuthProvider(auth: Auth(),child:BookApp()));
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
            appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              elevation: 5,
              color: ThemeData.light().canvasColor,
            )
        ),
      home: RootPage(auth: new Auth()),
    );
  }
}