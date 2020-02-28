import 'package:bookbook/app_screens/test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookbook/app_screens/first_screen.dart';
import 'package:bookbook/app_screens/displayproduct/productlist.dart';

QuerySnapshot object;

var depname = [ "computer" , "Civil" , "Mehanical"
];

  final imageList = [
    "depimages/cedep.jpg",
    "depimages/cedep.jpg",
    "depimages/cedep.jpg",
    "depimages/cedep.jpg",
    "depimages/cedep.jpg",
  ];

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Firestore.instance.collection('computer').getDocuments().then((results) {
  //     setState(() {
  //       object = results;
  //     });
  //   });
  // }

  Icon searchIcon = new Icon(Icons.search);
  int things = 0;
//  void productName()
//  {
//  while(things<= object.documents.length){
//    things = things+1;
//  }

//  }

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Test()));
                  }),
            ],
            backgroundColor: Colors.white,
            leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => element()));
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body:  GridView.builder(
                    itemCount: object.documents.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return departments(
                        imageList[index], depname[index]);
                    },
                    physics: ClampingScrollPhysics(),
                  ),
          
          // StreamBuilder(
          //     stream: Firestore.instance.collection('computer').snapshots(),
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return Container(
          //           alignment: Alignment.center,
          //           child: CircularProgressIndicator(),);
          //       } else {
          //         return GridView.builder(
          //           itemCount: snapshot.data.documents.length,
          //           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 2),
          //           itemBuilder: (BuildContext context, int index) {
          //             DocumentSnapshot docsnap = snapshot.data.documents[index];
          //             return departments(
          //                 "depimages/cedep.jpg", docsnap['title']);
          //           },
          //           physics: ClampingScrollPhysics(),
          //         );
          //       }
          //     })

          // ListView(children: <Widget>[
          //   SizedBox(height: 20.0),
          //   Row(
          //       verticalDirection: VerticalDirection.down,
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: <Widget>[
          //         Column(
          //           children: <Widget>[
          
          //             // builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          //             //   //for(things=0;things<3;things++){
          //             //     return
          //             //  // }
          //             // }
          //             // ),
          //             departments("depimages/cedep.jpg", object.documents[0].data['title']),
          //             departments('depimages/ecdep.PNG', 'Ec'),
          //           ],
          //         ),
          //       ])
          // ]),


    ),
    );
  }

  Widget departments(String imgpath, String depname) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
          height: 200,
          width: (MediaQuery.of(context).size.width / 2) - 20.0,
          decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2.0,
                    blurRadius: 2.0)
              ]),
          child: Material(
              child: InkWell(
            onTap: () =>{
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductsCom(),
                  )),
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
                            image: AssetImage(imgpath), fit: BoxFit.fitHeight)),
                  )
                ]),
                Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    depname,
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
    );
  }
}
