import 'package:bookbook/app_screens/home_screen.dart';
import 'package:bookbook/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _dropDownValue;

class SignupPage extends StatefulWidget {
  //SignupPage({this.auth});
  final BaseAuth auth;
  const SignupPage({Key key, this.onSingedIn, this.auth});
  final VoidCallback onSingedIn;
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = new GlobalKey<FormState>();
  // final FirebaseAuth _auth=FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn=new GoogleSignIn();
  // Future<FirebaseUser> _signIn() async{
  //     GoogleSignIn()
  // }
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
  String name;
  String mobileno;
  String college;
 void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        //String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
        AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        await users(uid: user.user.uid).addUserData(name, mobileno, _email, college );
       // 
                var map = <String, int>{};
        
                Firestore.instance.collection('cart').document(user.user.uid).setData(map);
                widget.onSingedIn();
                // AuthResult result = await FirebaseAuth.instance
                //     .createUserWithEmailAndPassword(email: _email, password: _password);
                //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        
                // FirebaseUser user = result.user;
                print('signed in: $user');
                //if(user.uid==false){
                    print('Enter valid Email');
                          
                //}
              } catch (e) {
                print('Error: $e');
              }
            }
          }
          @override
          Widget build(BuildContext context) {
            return new Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                          child: Text(
                            'Signup',
                            style:
                                TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                          child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                                
                          ),
                        )
                      ],
                    ),
                  ),
                  Form(
                      key: formkey,
                  child: Container(
                      padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[

                          //  TextFormField(
                          //   decoration: InputDecoration(
                          //       labelText: 'COLLEGE',
                          //       labelStyle: TextStyle(
                          //           fontFamily: 'Montserrat',
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.grey),
                          //       focusedBorder: UnderlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.deepPurple))),
                          //            validator: (value) => value.isEmpty ? 'College field Can not be empty' : null,
                          //             onSaved: (value) => college = value,
                                    
                          // ),


                           Container(
                padding: EdgeInsets.all(10),
                child: DropdownButton(

                  iconEnabledColor: Colors.grey,
                 
                  hint: _dropDownValue == null
                      ? Text('COLLEGE')
                      : Text(
                          _dropDownValue,
                          style: TextStyle(color: Colors.black,
                          fontFamily: 'Montserrat',

                          ),
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.black,
                   fontFamily: 'Montserrat',),
                  items: ['adit', 'cspit', 'gcet', 'it'].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val;
                      },
                    );
                  },
                ),
              ),



                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'NAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                                     validator: (value) => value.isEmpty ? 'Name Can not be empty' : null,
                                      onSaved: (value) => name = value,
                                     
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'MOBILE NUMBER',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                                     validator: (value) => value.isEmpty ? 'Mobile Number Can not be empty' : null,
                                      onSaved: (value) => mobileno = value,
                          ),
                          SizedBox(height: 10.0),
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
                             validator: (value) => value.isEmpty ? 'Password Can not be empty' : null,
                          onSaved: (value) => _password = value,
                          ),
                          SizedBox(height: 50.0),
                          RaisedButton(
                            color: Colors.white,
                            elevation: 0,
                            child:  Container(
                              height: 40.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.deepPurpleAccent,
                                color: Colors.deepPurple,
                                elevation: 7.0,
                                child: GestureDetector(
                                  child: Center(
                                    child: Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                          
                                    ),
                                  ),
                                ),
                              )
                              
                              ),
                              onPressed:validateAndSubmit,
                              ),
                         
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: 
                                
                                    Center(
                                      child: Text('Go Back',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                                
                                
                              ),
                            ),
                          ),
                        ],
                      ))),
                  // SizedBox(height: 15.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Text(
                  //       'New to Spotify?',
                  //       style: TextStyle(
                  //         fontFamily: 'Montserrat',
                  //       ),
                  //     ),
                  //     SizedBox(width: 5.0),
                  //     InkWell(
                  //       child: Text('Register',
                  //           style: TextStyle(
                  //               color: Colors.green,
                  //               fontFamily: 'Montserrat',
                  //               fontWeight: FontWeight.bold,
                  //               decoration: TextDecoration.underline)),
                  //     )
                  //   ],
                  // )
                ]));
          }
        
          
}