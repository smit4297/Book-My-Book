import 'package:bookbook/app_screens/displayproduct/productlist.dart';
import 'package:bookbook/app_screens/displayproduct/productlistCL.dart';
import 'package:bookbook/app_screens/test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookbook/app_screens/first_screen.dart';

QuerySnapshot object;

class ProductList extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<ProductList> {
  Icon searchIcon = new Icon(Icons.search);
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance.collection('computer').getDocuments().then((results) {
      
      setState(() {
        object = results;
      });
    });
  }

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
        body:

        ListView(children: <Widget>[

          Container(
          padding: EdgeInsets.only(left:10, right: 10, top: 20, bottom: 10),
            height: 200,
            width: 620,
           
            child: Container(
              
             // color: Colors.white,
              decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom()));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/cedep.jpg'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Computer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Container(
              decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCL()));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/civildep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Civil',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Container(
               decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom()));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/ecdep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'EC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Container(
               decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom()));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/mechdep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Mechanical',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Container(
               decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom()));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/itdep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Information technology',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Container(
               decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom()));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/mechdept1.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Mechatonics',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),

        ],) 
        
        
      ),
    );
  }
}
