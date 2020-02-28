import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class users{
  String name;
  String number;
  String email;
  String college;


final String uid;

users({this.uid});

final CollectionReference ref = Firestore.instance.collection('users');

Future addUserData(String name, String number, String email, String college) async{
  return await ref.document(uid).setData({
    'Name': name,
    'Number': number,
    'Email': email,
    'College': college,
  });
}

@override
Future<String> currentUser() async{
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final String uid = user.uid.toString();
  return uid;
}
}