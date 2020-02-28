import 'package:flutter/cupertino.dart';

import 'auth.dart';

class AuthProvider  extends InheritedWidget{

  const AuthProvider({Key key, Widget child, this.auth}) : super(key :key, child: child);
  final BaseAuth auth;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  static AuthProvider of(BuildContext context){
    // TODO: implement updateShouldNotify
    return context.inheritFromWidgetOfExactType(AuthProvider);
  }
}