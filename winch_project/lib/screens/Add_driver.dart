import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/request.dart';
import 'package:winch_project/screens/winch.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  int index = 0;
  final screens = [
    //const winch2(),
    const request(),
  ];
  @override
  Widget build(BuildContext context)
  =>Scaffold(
    floatingActionButton: buildNavigateButton(),
      extendBody: true,
      body: screens[index],
      backgroundColor:Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ), //color of icon itself
        child: CurvedNavigationBar(
          height: 50,
          items: items,
          index: index,
          buttonBackgroundColor: Mycolor.teal,
          backgroundColor: Mycolor.transparent,
          color: Mycolor.darkblue,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) => setState(() => this.index = index),

        ),

      )

  );
  Widget buildNavigateButton()=>FloatingActionButton.extended(
    icon:Icon(Icons.add),
    label:Text('Add winch'),
    backgroundColor: Colors.blue,
    onPressed: (){},
  );
    final items = <Widget>[
      ImageIcon(
        AssetImage('assets/images/team.png'),
        size: 30.0,
      ),
       ImageIcon(
        AssetImage('assets/images/winch.png'),
        size: 30.0,
      ),

    ];


}









