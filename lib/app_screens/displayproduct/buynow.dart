import 'package:bookbook/app_screens/test.dart';
import 'package:flutter/material.dart';

class BuyNow extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<BuyNow> {
  Icon searchIcon = new Icon(Icons.search);

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Test()));
                  }),
            ],
            backgroundColor: Colors.white,
            leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Container(
            
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: 70,
                      margin: EdgeInsets.only(top: 20),
                      child: ListTile(
                        title: Text('Css Book',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'Montserrat',
                            )),
                        subtitle: Text('Harsh Patel',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            )),
                      ),
                    ),

                    Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  height: 200,
                  child: ListTile(
                    title: Text('about',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                        )),
                    subtitle: Text('About this item.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        )),
                  ),
                ),

                  ])


                ],
              )),
          bottomNavigationBar: Material(
            elevation: 15,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 55.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 192.5,
                      child: Text(
                        'ADD TO BAG',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 200,
                      color: Colors.deepPurple,
                      child: InkWell(
                        //onTap: () => navigateToDetail(snapshot.data[index]),

                        child: Text(
                          'BUY NOW',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
