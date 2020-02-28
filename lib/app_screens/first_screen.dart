import 'package:bookbook/app_screens/NewProduct.dart';
import 'package:bookbook/app_screens/displayproduct/display.dart';
import 'package:bookbook/app_screens/displayproduct/productlist.dart';
import 'package:bookbook/app_screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'displayproduct/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuerySnapshot qn;

class element extends StatelessWidget {
  final VoidCallback college;
  const element({
    Key key,
    this.college,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Carousel();
  }
}

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  Icon searchIcon = new Icon(Icons.search);
  Icon bookIcon = new Icon(Icons.bookmark);
  Icon navigatebarIcon = new Icon(Icons.desktop_windows);
  PageController _pageController;
  int currentPage = 0;
  final imageList = [
    "images/cssbook.jpg",
    "images/javabook.png",
    "images/phpbook.jpg",
    "images/nodejsbook.jpeg",
    "images/csharbook.png",
  ];

  Future getPoasts() async {
    var firestore = Firestore.instance;
    qn = await firestore
        .collection(college)
        .document("department")
        .collection("computer")
        .getDocuments();
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
  void initState() {
    super.initState();
    // getPoasts();
    Firestore.instance
        .collection(college)
        .document("department")
        .collection("computer")
        .getDocuments()
        .then((results) {
      setState(() {
        qn = results;
      });
    });

    _pageController = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        elevation: 5,
        color: ThemeData.light().canvasColor,
      )),
      home: Scaffold(
        //drawer: new Drawer(),
        //   child: FlatButton(
        //     child: Text(
        //       'SIGNOUT',
        //       style: TextStyle(fontSize: 20.0),
        //     ),
        //     onPressed: widget._signOut,
        //   ),
        //
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "BookMyBook",
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
                      MaterialPageRoute(builder: (context) => display()));
                }),
            IconButton(icon: bookIcon, color: Colors.black, onPressed: () {}),
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "New Books",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Center(

                  


                  child: Container(
                    height: 300,
                    child: PageView.builder(
                        itemCount: imageList.length,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return animateItemBuilder(index);
                        }),
                  ),
                ),

                //Corosuel(),

                Padding(
                  padding: const EdgeInsets.only(right: 210),
                  child: Text(
                    "Recently Added",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      height: (qn.documents.length * 3) * 42.0,
                      child: FutureBuilder(
                          future: getPoasts(),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return GridView.builder(
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.80),
                                itemBuilder: (_, index) {
                                  return Container(
                                      //padding: EdgeInsets.all(5),
                                      height:
                                          (MediaQuery.of(context).size.width /
                                              2),
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20.0,
                                      decoration: BoxDecoration(
                                          //color: Colors.white10,

                                          // borderRadius: BorderRadius.circular(5.0),

                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 1.0,
                                                blurRadius: 0.0)
                                          ]),
                                      child: Material(
                                          child: InkWell(
                                        onTap: () => navigateToDetail(
                                            snapshot.data[index]),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              color: Colors.white10,
                                              child: Stack(children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 30),
                                                  height: 150.0,
                                                  child: InkResponse(
                                                    child: Image.network(
                                                      '${snapshot.data[index].data["image"]}' +
                                                          '?alt=media',
                                                      height: 200,
                                                      width: 180,
                                                    ),
                                                  ),
                                                  // decoration: BoxDecoration(
                                                  //     borderRadius: BorderRadius.only(
                                                  //         topLeft: Radius.circular(10.0),
                                                  //         topRight: Radius.circular(10.0)),
                                                  //    ),
                                                ),
                                              ]),
                                            ),
                                            Container(
                                              //color: Colors.white,
                                              padding: EdgeInsets.only(top: 35),
                                              child: Text(
                                                snapshot
                                                    .data[index].data["title"],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.white,
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                snapshot
                                                    .data[index].data["price"],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ),
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
                          })),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  animateItemBuilder(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
          }

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * 250,
              width: Curves.easeOut.transform(value) * 250,
              child: child,
            ),
          );
        },
        child: Container(
            child: Card(
                elevation: 5,
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                 Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NewThing()));
              },
                  child: Image.asset(imageList[index], fit: BoxFit.fill),
                ))));
  }

}

// class Corosuel extends StatefulWidget {

//   @override
//   _CorosuelState createState() => _CorosuelState();
// }

// class _CorosuelState extends State<Corosuel> {
//   PageController _pageController;
//    int currentPage = 0;
//   final imageList = [
//     "images/cssbook.jpg",
//     "images/mlbook.jpeg",
//     "images/phpbook.jpg",
//     "images/nodejsbook.jpeg",
//     "images/csharbook.png",
//   ];

//    animateItemBuilder(int index) {
//     return AnimatedBuilder(
//         animation: _pageController,
//         builder: (context, child) {
//           double value = 1;
//           if (_pageController.position.haveDimensions) {
//             value = _pageController.page - index;
//             value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
//           }

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(
//       initialPage: currentPage,
//       keepPage: false,
//       viewportFraction: 0.5,
//     );

//       Firestore.instance.collection('newbooks').getDocuments().then((results){
//       setState(() {
//         object=results;
//       });

//     });
//   }

//           return Center(
//             child: SizedBox(

//               height: Curves.easeOut.transform(value) * 250,
//               width: Curves.easeOut.transform(value) * 250,
//               child: child,
//             ),
//           );
//         },
//         child: Container(child: Card(
//            elevation: 5,
//           color: Colors.white,

//           child: InkWell(
//           onTap: () => null,
//           child: Image.asset(imageList[index], fit: BoxFit.fill),

//     ))));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                     height: 300,
//                     child: PageView.builder(
//                         itemCount: object.documents.length,

//                         onPageChanged: (value) {
//                           setState(() {
//                             currentPage = value;
//                           });
//                         },
//                         controller: _pageController,
//                         itemBuilder: (context, index) {
//                           return animateItemBuilder(index);
//                         }),
//                   );
//   }
// }
