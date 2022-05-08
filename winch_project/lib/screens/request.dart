
import 'package:flutter/material.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
class request extends StatelessWidget {
  const request({Key? key}) : super(key: key);
  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
    prefixIcon,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(56),
          primary: Colors.white,
          onPrimary: Colors.black45,
          textStyle: TextStyle(fontSize: 16),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Mycolor.teal),
            const SizedBox(width: 16),
            Text(title),
            const SizedBox(height: 48),
          ],
        ),
        onPressed: onClicked,
      );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Mycolor.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    "Add your winch",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Winch driver Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Mycolor.teal,
                              ),
                              border: InputBorder.none),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Driver National ID Number",
                              prefixIcon: Icon(
                                Icons.call_rounded,
                                color: Mycolor.teal,
                              ),
                              border: InputBorder.none),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Driver Phone Number",
                              prefixIcon: Icon(
                                Icons.call_rounded,
                                color: Mycolor.teal,
                              ),
                              border: InputBorder.none),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Winch Plates Number",
                              prefixIcon: Icon(
                                Icons.call_rounded,
                                color: Mycolor.teal,
                              ),
                              border: InputBorder.none),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildButton(
                        title: 'Photo of the front of winch driver licence ',
                        icon: Icons.image_outlined,
                        prefixIcon: Mycolor.teal,
                        onClicked: () {},
                      ),
                      const SizedBox(height: 10),
                      buildButton(
                        title: 'Photo of the front of winch licence  ',
                        icon: Icons.image_outlined,
                        prefixIcon: Mycolor.teal,
                        onClicked: () {},
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Mycolor.red,
                            fixedSize: const Size(200, 43),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),

                          onPressed: () {
                            }
                            //  return Signup2();
                          ,child: const Text('Add',
                              style: TextStyle(
                                fontSize: 18,
                              ))

                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //this the widget that contain body and appbar
  }
}


