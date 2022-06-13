import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winch_project/screens/colors.dart';

import '../../pojo/driverdetails.dart';
import '../../pojo/requst_from_user.dart';
import 'InvitationScreen.dart';
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

    child:   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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

                ElevatedButton(onPressed: (){
                  FirebaseFirestore.instance.collection("requset winsh").doc(details.userid)
                      .update({"status": "processing"}).then((value) => {

                        FirebaseFirestore.instance.collection("driver details").doc("${FirebaseAuth.instance.currentUser!.uid}")
                        .update({"status":"OFF"}).then((value) => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => InvitationScreen(
                                uuid: details.userid,
                              ))),
                        })



                  });
                }, child: Text("Accept"))

              ],
            ),

          ],
        ),
      ),
    ),
  );
}
