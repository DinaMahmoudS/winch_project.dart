import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/company_login/flutter_toast.dart';
import 'package:winch_project/screens/company_signup/cubit.dart';
import 'package:winch_project/screens/company_signup/states.dart';
import 'package:winch_project/screens/splash.dart';
/*
.collection("driver details")
.where("comuID", "==", "VLfPaYesOGObVBRyrPtjDoak3aI2")
*/
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
  late String _email = "" , name = "", phone ="", nationalID ="",plates ="";

  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();

  initState() {
    super.initState();

    FirebaseFirestore.instance.collection("company details")
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get().then((value) => {
      name = value.get("company_address"),
      _email = value.get("name"),
      phone = value.get("number"),
      nationalID = value.get("number"),
      plates = value.get("password"),

    });
    _email = "";
    name = "";
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
                              "Profile Company",
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
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF59769E),
                                        ))),
                                child: Text("${_email}",),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF59769E),
                                        ))),
                                child: Text("******",),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF59769E),
                                        ))),
                                child: Text("${name}",),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF59769E),
                                        ))),
                                child: Text("${nationalID}",),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF59769E),
                                        ))),
                                child: Text("${phone}",),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFF59769E),
                                        ))),
                                child: Text("${plates}",),
                              ),
                              const SizedBox(height: 10),
                              /* buildButton(
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
                        const SizedBox(height: 30),*/
                              ConditionalBuilder(
                                condition:state is! ComSignupLoadingState,
                                builder:(context)=>
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Mycolor.red,
                                          fixedSize: const Size(300, 43),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (BuildContext context) {
                                                return const Splash();
                                              }));
                                          //  return Signup2();
                                        },
                                        child: const Text('Logout',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ))),
                                fallback:(context)=> CircularProgressIndicator(),
                              ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    //this the widget that contain body and appbar
  }
}
