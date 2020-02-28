import 'package:bookbook/app_screens/displayproduct/product.dart';
import 'package:bookbook/app_screens/first_screen.dart';
import 'package:bookbook/app_screens/profile.dart';
import 'package:bookbook/app_screens/test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


QuerySnapshot qn;
String index;


class Categoriess extends StatefulWidget {
  final VoidCallback college;
  const Categoriess({Key key, this.college});

  @override
  _CategoriessState createState() => _CategoriessState();
}

class _CategoriessState extends State<Categoriess> {
  Icon searchIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            elevation: 5,
            color: ThemeData.light().canvasColor,
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Categories",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,

              // fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: new IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                icon: searchIcon,
                color: Colors.black,
                onPressed: () {
                  heroTag:
                  "search";
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Test()));
                }),
          ],
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => element()));
            },
            icon: Icon(Icons.arrow_back),
          ),
      ),
      
      body: ListPage(),
      
      ),
      );
  }
}

class ListPage extends StatefulWidget {
 
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
   navigateToDetail(DocumentSnapshot computer) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => thing(
                  computer: computer,
                )));
  }

  
  Widget build(BuildContext context) {
    return  StreamBuilder(
              stream: Firestore.instance.collection(college).document("department").collection("computer").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),);
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data.documents.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot docsnap = snapshot.data.documents[index];
                      // return departments(
                      //     "depimages/cedep.jpg", docsnap['title']);
                    },
                    physics: ClampingScrollPhysics(),
                  );
                }
              });
  }
}