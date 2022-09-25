import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/company_login/flutter_toast.dart';
import 'package:winch_project/screens/company_signup/cubit.dart';
import 'package:winch_project/screens/company_signup/states.dart';
import 'package:winch_project/screens/splash.dart';
import '../Home.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();

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
}

class _ProfileState extends State<Profile> {
  late String _email = "", address = "", phone = "", plates = "";

  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();

  initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("company details")
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get()
        .then((value) => {
              address = value.get("company_address"),
              _email = value.get("name"),
              phone = value.get("number"),
            });
    _email = "";
    address = "";
    phone = "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ComSignupCubit(),
      child: BlocConsumer<ComSignupCubit, ComSignupStates>(
        listener: (context, state) {
          if (state is CreateComSuccessState) {
            FirebaseAuth.instance.signOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const Home();
            }));
          }

          if (state is ComSignupErrorState) {
            return showToastWithMsg(state.error);
          }
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Mycolor.darkblue,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                title: const Text(
                  "Company Profile",
                  style: TextStyle(fontSize: 25),
                ),
                centerTitle: true,
              ),
              body: Container(
                alignment: Alignment.center,
                color: Mycolor.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child:
                              //InputField(),
                              Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Mycolor.teal,
                                    ),
                                    Text("   ${_email}",
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17))
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.call_rounded,
                                      color: Mycolor.teal,
                                    ),
                                    Text(
                                      "   ${phone}",
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox( height: 30,),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.plagiarism,
                                      color: Mycolor.teal,
                                    ),
                                    Text("   ${address}",
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Column(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Mycolor.red,
                                        fixedSize: const Size(300, 43),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();

                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return Splash();
                                        }));
                                      },
                                      child: const Text(
                                          ''
                                          'log out',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ))),
                                ],
                              ),
                              const SizedBox(height: 70),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
