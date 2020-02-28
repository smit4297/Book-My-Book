import 'package:bookbook/app_screens/home_screen.dart';
import 'package:bookbook/app_screens/initialPages/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'auth.dart';

class MyHomePage extends StatefulWidget {
   //MyHomePage({this.auth, this.onSignedIn});
   final BaseAuth auth;
  const MyHomePage({Key key, this.onSignedIn, this.auth});
  final VoidCallback onSignedIn;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//enum FormType { login, register }

class _MyHomePageState extends State<MyHomePage> {
  final formkey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
      //print('Form is valid,Email: $_email, Password: $_password');
    } else {
      //print('form is invalid,Email: $_email, Password: $_password');
      return false;
    }
  }

  String _email;
  String _password;
  //FormType _formType = FormType.login;

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
        // AuthResult result = await FirebaseAuth.instance
        //     .signInWithEmailAndPassword(email: _email, password: _password);
        //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
        //     FirebaseUser user = result.user;
        print('signed in: $userId');
        widget.onSignedIn();
            
         try{
           //if(user.uid==false);
       }catch(e){
        
           //Toast.show(e.toString('Invalid Email'), context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM );
       }
       }catch (e) {
        print('Error: $e');
        
      }
    }
  }

  // void moveToRegister() {
  //   setState(() {
  //     _formType = FormType.register;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple)),
                  ),
                ],
              ),
            ),
            Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: buildInputs() + buildSubmitButtons(),
                        )),
                  ],
                )),
          ],
        ));
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (value) => value.isEmpty ? 'Email Can not be empty' : null,
        onSaved: (value) => _email = value,
      ),
      SizedBox(height: 20.0),
      TextFormField(
        decoration: InputDecoration(
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        obscureText: true,
        validator: (value) =>
            value.isEmpty ? 'Password Can not be empty' : null,
        onSaved: (value) => _password = value,
      ),
      SizedBox(height: 40.0),
    ];
  }

  List<Widget> buildSubmitButtons() {
    //if(_formType == FormType.login){
    return [
      RaisedButton(
        color: Colors.white,
        highlightElevation: 0,
        hoverElevation: 0, 
        elevation: 0,
        hoverColor: Colors.white10,
        disabledElevation: 0.0,
        highlightColor: Colors.white,
        child: Container(

          height: 40.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.deepPurpleAccent,
            color: Colors.deepPurple,
            elevation: 7.0,
            child: GestureDetector(
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),

              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ),
        onPressed: validateAndSubmit,
      ),
      





        RaisedButton(
        color: Colors.white,
        highlightElevation: 0,
        hoverElevation: 0, 
        elevation: 0,
        hoverColor: Colors.white10,
        disabledElevation: 0.0,
        highlightColor: Colors.white,
        child: Container(

          height: 40.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.deepPurpleAccent,
            color: Colors.deepPurple,
            elevation: 7.0,
            child: GestureDetector(
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),

              child: Center(
                child: Text(
                  'Sign in with google',
                  
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ),
        onPressed: () async {
                  bool res = await AuthProvider().lWithGoogle();
                  if(!res)
                    print("error logging in with google");
                },
      ),







      SizedBox(height: 20.0),
      Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'New to BookMyBook ?',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
          SizedBox(width: 5.0),
          FlatButton(
            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(auth: new Auth(),)),
                             );
                          },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          )
        ]),
      ),
    ];
  //}


}
}
