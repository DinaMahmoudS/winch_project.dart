import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../pojo/driverdetails.dart';
import '../../pojo/requst_from_user.dart';
class DriverHome extends StatefulWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          children: <Widget>[
            Expanded(child:StreamBuilder<List<RequstWinsh>>(
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
  }

  Stream<List<RequstWinsh>> readDriver() =>
      FirebaseFirestore.instance.collection("requset winsh").snapshots().map(
              (event) => event.docs.map((e) => RequstWinsh.fromJson(e.data())).toList());


  Widget buildDriver(RequstWinsh details) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

    child:   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/logo.png',
            height: 50,
            width: 50,
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
            Text(
              '${details.location}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),

      ],
    ),
  );
}
