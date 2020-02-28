import 'package:bookbook/app_screens/profile.dart';
import 'package:bookbook/app_screens/test.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuerySnapshot object;

class display extends StatefulWidget {
  @override
  _displayState createState() => _displayState();
}

class _displayState extends State<display> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance.collection('cspit').document("V9sdZsSPocaaYzFjtj2M").collection('computer').getDocuments().then((results){
      setState(() {
        object=results;
      });
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      
      child: Text(object.documents[0].data['title']),
      
    );
  }
}
//   QuerySnapshot qn;
// class DisplayProduct extends StatefulWidget {
//    final VoidCallback name, mobile, college, email;
//   const DisplayProduct({Key key, this.name, this.mobile, this.college, this.email});

//   @override
//   _DisplayProductState createState() => _DisplayProductState();
// }

// class _DisplayProductState extends State<DisplayProduct> {
//   @override
//    Icon searchIcon = new Icon(Icons.search);
//    void initState() {
//     // TODO: implement initState
//     super.initState();
//    Firestore.instance.collection(college).document("department").collection("computer").
//        where('number', isEqualTo: email).where('username', isEqualTo: name).getDocuments().then((results){
//       setState(() {
//         qn=results;
//       });
      
//     });
//   }

//   @override
// Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//           appBarTheme: AppBarTheme(
//             brightness: Brightness.light,
//             elevation: 5,
//             color: ThemeData.light().canvasColor,
//           )),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: false,
//           title: Text(
//             "Add to cart",
//             style: TextStyle(
//               fontSize: 22,
//               color: Colors.black,
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.bold,

//               // fontWeight: FontWeight.bold,
//             ),
//           ),
//           iconTheme: new IconThemeData(color: Colors.black),
//           actions: <Widget>[
//             IconButton(
//                 icon: searchIcon,
//                 color: Colors.black,
//                 onPressed: () {
//                   heroTag:
//                   "search";
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Test()));
//                 }),
//           ],
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             color: Colors.black,
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(Icons.arrow_back),
//           ),
//         ),

//         body: Container(
//           height: 300,
//           child: displayData(),
//         ),
//       ),
//     );
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
