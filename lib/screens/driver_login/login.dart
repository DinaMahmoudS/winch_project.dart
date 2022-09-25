import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/driver_home/home_driver.dart';
import 'package:winch_project/screens/driver_login/cubit.dart';
import 'package:winch_project/screens/driver_login/flutter_toast.dart';
import 'package:winch_project/screens/driver_login/states.dart';
import 'package:winch_project/screens/forgotpassword.dart';

class LoginDriver extends StatefulWidget {
  LoginDriver({Key? key}) : super(key: key);

  @override
  State<LoginDriver> createState() => _LoginState();
}

class _LoginState extends State<LoginDriver> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DrivLoginCubit(),
      child: BlocConsumer<DrivLoginCubit, DrivLoginStates>(
        listener: (context, state) {
          if (state is DrivLoginErrorState) {
            return showToastWithMsg(state.error);
          }
          if (state is DrivLoginSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const DriverHome();
            }));
          }
        },
        builder: (context, state) {
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
                                "DRIVER LOGIN",
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
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: Color(0xFF59769E),
                                  ))),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your email';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText: "E-mail",
                                        icon: Icon(
                                          Icons.email,
                                          color: Mycolor.teal,
                                        ),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.emailAddress,
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
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your password';
                                      }
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
                                        icon: Icon(
                                          Icons.lock,
                                          color: Mycolor.teal,
                                        ),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return Forgot();
                                          }));
                                        },
                                        child: const Text("Forgot Password?")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ConditionalBuilder(
                          condition: state is! DrivLoginLoadingState,
                          builder: (context) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Mycolor.red,
                                fixedSize: const Size(300, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  DrivLoginCubit.get(context).DrivLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          fallback: (context) => CircularProgressIndicator(),
                        ),
                      ]),
                ),
              ));
        },
      ),
    );
  }
}
