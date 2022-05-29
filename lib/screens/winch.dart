import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:winch_project/Home.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/request.dart';

import '../pojo/driverdetails.dart';

class winch extends StatefulWidget {
  const winch ({Key? key}) : super(key: key);

  @override
  State<winch> createState() => _winchState();
}


class _winchState extends State<winch> {
  @override
  Widget build(BuildContext context) =>Scaffold(
    floatingActionButton: buildNavigateButton(),
    extendBody: true,
    backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Mycolor.transparent,
        backgroundColor: Mycolor.transparent,
        color: Mycolor.transparent,
        items: [const ImageIcon(
        AssetImage("assets/images/winch.png"),
        size: 30.0,
      ),
        const ImageIcon(
          AssetImage("assets/images/team.png"),
          size: 30.0,
        ),],),
    body: Container(
      child: Column(
        children: <Widget>[
          Expanded(child:StreamBuilder<List<DriverDetails>>(
            stream: readDriver(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final users = snapshot.data!;
                if (users.contains("false")) {
                  return Text(
                    "no friends for you",
                    style: TextStyle(color: Colors.black),
                  );
                } else {
                  // return Text("no friends you" , style: TextStyle(color: Colors.white),);
                  return ListView(
                    children: users.map(buildDriver).toList(),
                  );
                }
              } else if (snapshot.hasError) {
                return Text(
                  "hasError ${snapshot.error}",
                  style: TextStyle(color: Colors.black),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          )

        ],
      ),
    ),




  );
  Widget buildNavigateButton()=>FloatingActionButton.extended(
  icon:Icon(Icons.add),
  label:Text('Add Driver'),
  backgroundColor: Colors.blue,
  onPressed: (){
  Navigator.push(context, MaterialPageRoute(
  builder: (BuildContext context) {
  return request();
  })
  );
  },

  );

  Stream<List<DriverDetails>> readDriver() =>
      FirebaseFirestore.instance.collection("driver details").snapshots().map(
              (event) => event.docs.map((e) => DriverDetails.fromJson(e.data())).toList());


  Widget buildDriver(DriverDetails details) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

    child:   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/logo.jpg',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Text(
              '${details.name}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),

      ],
    ),
  );
}
