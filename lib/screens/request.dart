import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/company_login/flutter_toast.dart';
import 'package:winch_project/screens/company_signup/cubit.dart';
/*
.collection("driver details")
.where("comuID", "==", "VLfPaYesOGObVBRyrPtjDoak3aI2")
*/
import '../Home.dart';
import 'company_signup/states.dart';

class request extends StatefulWidget {
  const request({Key? key}) : super(key: key);

  @override
  State<request> createState() => _requestState();

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

class _requestState extends State<request> {
  var dri_nameController = TextEditingController();
  var dri_nationalIdController = TextEditingController();
  var dri_phoneController = TextEditingController();
  var dri_emailController = TextEditingController();
  var dri_passwordController = TextEditingController();
  var dri_platesController = TextEditingController();
  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();

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
                                child: TextFormField(
                                  controller: dri_emailController,
                                  decoration: InputDecoration(
                                      hintText: "Winch driver Email",
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
                                child: TextFormField(
                                  controller: dri_passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter your password';
                                    }
                                    if (value.length < 6) {
                                      return 'The password you entered is less than 6 characters';
                                    }
                                    onChanged:
                                    (val) {
                                      setState(() => dri_passwordController =
                                          val as TextEditingController);
                                    };
                                  },
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Mycolor.teal,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Mycolor.teal,
                                      ),
                                      border: InputBorder.none),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Color(0xFF59769E),
                                ))),
                                child: TextFormField(
                                  controller: dri_nameController,
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
                                child: TextFormField(
                                  controller: dri_nationalIdController,
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
                                child: TextFormField(
                                  controller: dri_phoneController,
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
                                child: TextFormField(
                                  controller: dri_platesController,
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
                                    if (formKey.currentState!.validate()) {
                                      ComSignupCubit.get(context).DrivSignup(
                                        email: dri_emailController.text,
                                        password: dri_passwordController.text,
                                        name: dri_nameController.text,
                                        nationalID: dri_nationalIdController.text,
                                        phone: dri_phoneController.text,
                                        plates: dri_platesController.text,
                                        comuID: "${FirebaseAuth.instance.currentUser!.uid.toString()}",
                                      );
                                    } else {
                                      showToastWithMsg("error ......");
                                    }
                                    //  return Signup2();
                                    showToastWithMsg("Added Loading ......");
                                  },
                                  child: const Text('Add',
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
