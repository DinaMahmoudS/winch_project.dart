import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:winch_project/profile.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/winch.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final screens = [
    winch(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const ImageIcon(
        AssetImage("assets/images/winch.png"),
        size: 30.0,
      ),
      const ImageIcon(
        AssetImage("assets/images/team.png"),
        size: 30.0,
      ),
    ];

    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ), //color of icon itself

        child: CurvedNavigationBar(
          height: 58,
          items: items,
          index: index,
          buttonBackgroundColor: Mycolor.teal,
          backgroundColor: Mycolor.transparent,
          color: Mycolor.darkblue,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
