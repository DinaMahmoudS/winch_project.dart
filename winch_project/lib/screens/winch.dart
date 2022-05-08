import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:winch_project/Home.dart';
import 'package:winch_project/screens/request.dart';

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
      bottomNavigationBar: CurvedNavigationBar(items: [const ImageIcon(
        AssetImage("assets/images/winch.png"),
        size: 30.0,
      ),
        const ImageIcon(
          AssetImage("assets/images/team.png"),
          size: 30.0,
        ),],),



  );
  Widget buildNavigateButton()=>FloatingActionButton.extended(
  icon:Icon(Icons.add),
  label:Text('Add winch'),
  backgroundColor: Colors.blue,
  onPressed: (){
  Navigator.push(context, MaterialPageRoute(
  builder: (BuildContext context) {
  return request();
  })
  );
  },

  );

}
