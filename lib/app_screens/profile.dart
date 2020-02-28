import 'package:bookbook/app_screens/displayproduct/categories2.dart';
import 'package:bookbook/app_screens/first_screen.dart';
import 'package:bookbook/app_screens/initialPages/auth.dart';
import 'package:bookbook/app_screens/initialPages/auth_provider.dart';
import 'package:bookbook/app_screens/initialPages/login_screen.dart';
import 'package:bookbook/app_screens/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String name = ' ';
String email= ' ', mobile = ' ', college =' ';
final db = Firestore.instance;

class Profile extends StatefulWidget {

  final VoidCallback onSignedOut;
  const Profile({Key key, this.onSignedOut});
  @override
  _ProfileState createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {
  
  DocumentSnapshot snapshot;
  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  void getdata() async{
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    print(uid);
    snapshot = await db.collection('users').document(uid).get();
    setState(() {
      name = snapshot.data['Name'];
      email = snapshot.data['Number'];
      mobile = snapshot.data['Email'];
      college = snapshot.data['College'];
    });

    print(name);
    print(mobile);
    print(email);
    print(college);
  }


  // Future displayproduct() async {
  //   var firestore = Firestore.instance;

  //   qn = await firestore.collection(college).document("department").collection("computer").
  //   where('phoneno', isEqualTo: mobile).where('name', isEqualTo: name).getDocuments();
  //   //qn = await firestore.collection("cspit").getDocuments();
  //   return qn.documents;
  // }

   @override
   void initState(){
    // TODO: implement initState
     super.initState();
     getdata();
    //  var firestore = Firestore.instance;

    //   qn = await firestore.collection(college).document("department").collection("computer").
    //   where('phoneno', isEqualTo: mobile).where('name', isEqualTo: name).getDocuments();

     }
     
  //   //qn = await firestore.collection("cspit").getDocuments();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => element()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              color: Colors.black,
              onPressed: () {
                heroTag:
                "search";
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Test()));
              }),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white, 
               border: Border.all(color: Colors.grey.withOpacity(0.0)),
               boxShadow: [
                 BoxShadow(color: Colors.grey, //blurRadius: 1.0
                 ),
               ]
              ),
              alignment: Alignment(0.0, -0.50),
              height: 200,
              child: Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 25.0,
                  
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25.0, 150.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                   border: Border.all(color: Colors.grey.withOpacity(0.8)),
                  // boxShadow: [
                  //   BoxShadow(color: Colors.grey, blurRadius: 1.0),
                  // ]
                  ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(25.0, 25.0, 50.0, 25.0),
                          child: 
                          Image(height: 55,
                                width: 55,
                            image: AssetImage('depimages/user.png')),
                          ),
                      SizedBox(width: 100.0),
                      Container(
                        margin: EdgeInsets.fromLTRB(100.0, 37.0, 25.0, 25.0),
                        child: Text(
                          '$name',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ])
                  ]),
            ),
            Container(
              height: 300,
              margin: EdgeInsets.fromLTRB(25.0, 280.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                   border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  // boxShadow: [
                  //   BoxShadow(color: Colors.grey.withOpacity(0.7), //blurRadius: 1.0
                  //   ),
                  //]
                  ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                        child: ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('$email',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                              )),
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 0.0),
                        child: ListTile(
                          leading: Icon(Icons.email),
                          title: Text('$mobile',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                              )),
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(10.0, 130.0, 10.0, 0.0),
                        child: ListTile(
                          leading: Icon(Icons.school),
                          title: Text('$college',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                              )),
                        ),
                      ),

                      // FlatButton(
                      //   padding: EdgeInsets.fromLTRB(125.0, 230.0, 10.0, 0.0),
                      //   child: Text('Log Out', style: TextStyle(fontSize: 18.0),),
                      //   onPressed: (){
                      //     _signOut(context);
                      //     Route route = MaterialPageRoute(builder: (context) => MyHomePage());
                      //     Navigator.pushReplacement(context, route);
                      //   },),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 210),
                          height: 40.0,
                          width: 160,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.deepPurple,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: InkWell(
                              onTap: () {
                                _signOut(context);
                                Route route = MaterialPageRoute(
                                    builder: (context) => MyHomePage());
                                Navigator.pushReplacement(context, route);
                              },
                              child: Center(
                                child: Text('LOGOUT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                        ),
                      ),


                     SizedBox(height: 20),

                    
                    ])
                  ]),
            ),
          ]),

          SizedBox(height:10.0),

          Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "Your Uploads",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),

            SizedBox(height:10.0),

        Container(
          height: 500,
              child:  ListPage(),
        )

        ],
      ),
    );
  }


  
}

// class DisplayProduct extends StatefulWidget {
//   QuerySnapshot qn;
//   @override
//   _DisplayProductState createState() => _DisplayProductState();
// }

// class _DisplayProductState extends State<DisplayProduct> {
//   @override
//    void initState() {
//     // TODO: implement initState
//     super.initState();
//    Firestore.instance.collection(college).document("department").collection("computer").
//        where('phoneno', isEqualTo: mobile).where('name', isEqualTo: name).getDocuments().then((results){
//       setState(() {
//         qn=results;
//       });
      
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//           height: 300,
//           child: displayData(),
//         );
//   }

//   Widget displayData(){
//     return ListView.builder(
//       itemCount: qn.documents.length,
//       itemBuilder: (context, index){
//         child: Card(
//           elevation: 3,
//           child: ListTile(
//             title: Text('${qn.documents[index].data["title"]}'),
//             trailing: Text('${qn.documents[index].data["price"]}'),
//           ),
//         );
//         // onDismissed: (direction){
//         //   setState(() {
//         //     updateCart(index);
//         //   });
//         // },
         
//       }
//     );
//   }

// }

QuerySnapshot qn;



class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPoasts() async {
    var firestore = Firestore.instance;

      qn = await firestore.collection(college).document("department").collection("computer"). 
      where('username', isEqualTo: name).where('number', isEqualTo: email).getDocuments();

     //qn = await firestore.collection(college).document("department").collection("computer").getDocuments();
    //qn = await firestore.collection("cspit").getDocuments();

    return qn.documents;
  }

  // deleteData(){
    
  //    Firestore.instance.collection(college).document("department").collection("civil").document("EtACFkJ92NxKs4UjcZo3").delete().catchError((e){
  //      print(e);
  //    });
  //   //qn = await firestore.collection("cspit").getDocuments();

  //   return qn.documents;
    
  // }

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
                            //  onLongPress: deleteData(),
                         // onTap: () => navigateToDetail(snapshot.data[index]),
                          child: Column(
                            children: <Widget>[

                              Container(
                                padding: EdgeInsets.only(top:30),
                                child: Stack(children: <Widget>[
                                
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
