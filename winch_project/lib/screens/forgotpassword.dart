import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winch_project/screens/colors.dart';

class Forgot extends StatelessWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Mycolor.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Row(
                    children: const [
                      Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Number",
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
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Mycolor.teal,
                              ),
                              border: InputBorder.none),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
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
                              hintText: "Retype-Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Mycolor.teal,
                              ),
                              border: InputBorder.none),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Mycolor.red,
                          fixedSize: const Size(300, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'RESET PASSWORD',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
