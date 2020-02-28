import 'package:bookbook/app_screens/displayproduct/product.dart';
import 'package:bookbook/app_screens/test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:bookbook/app_screens/profile.dart";

QuerySnapshot qn;
String index;

class ProductsCL extends StatefulWidget {
   final VoidCallback college;
  const ProductsCL({Key key, this.college});
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<ProductsCL> {
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
            "Products",
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
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),

        body: ListPage(), //Container(
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPoasts() async {
    var firestore = Firestore.instance;

    qn = await firestore.collection(college).document("department").collection("civil").getDocuments();
    //qn = await firestore.collection("cspit").getDocuments();

    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot computer) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => thing(
                  computer: computer,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getPoasts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // return ListView.builder(
                //     itemCount: snapshot.data.length,
                //     itemBuilder: (_, index) {
                //       return ListTile(
                //         title: Text(snapshot.data[index].data["title"]),
                //         onTap: () => navigateToDetail(snapshot.data[index]),
                //       );
                //     });

                return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.80),
                  itemBuilder: (_, index) {
                    return Container(
                        height: (MediaQuery.of(context).size.width / 2),
                        width: (MediaQuery.of(context).size.width / 2) - 20.0,
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1.0,
                                  //blurRadius: 2.0
                                  )
                            ]),
                        child: Material(
                            child: InkWell(
                          onTap: () => navigateToDetail(snapshot.data[index]),
                          child: Column(
                            children: <Widget>[

                              Container(
                                padding: EdgeInsets.only(top:30),
                                child: Stack(children: <Widget>[
                                // Container(
                                //     height: 400.0,
                                //     child: prefix0.Carousel(
                                //       boxFit: BoxFit.scaleDown,
                                //       images: [
                                //         Image.network(
                                //           snapshot.data[index].data["image"],
                                //           fit: BoxFit.fitHeight,
                                //         ),
                                //       ],
                                //     )),
                                
                                Container(
                                  height: 150.0,
                                  child: InkResponse(
                                    child: Image.network('${snapshot.data[index].data["image"]}' + '?alt=media'),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0)),
                                     ),

                                )
                              ]),
                              ),
                              
                              Container(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                 // snapshot.data[index],
                                 //snapshot.data,
                                  snapshot.data[index].data["title"],
                                  //snapshot.data[index].data["title"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontFamily: 'Montserrat'),
                                ),
                              )
                            ],
                          ),
                        )));
                    //  return ListTile(
                    //    title: Text(snapshot.data[index].data["title"]),
                    //    onTap: () => navigateToDetail(snapshot.data[index]),
                    //  );
                  },
                  physics: ClampingScrollPhysics(),
                );
              }
            }));
  }
}
