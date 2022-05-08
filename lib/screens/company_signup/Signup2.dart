import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/Home.dart';
import 'package:winch_project/screens/colors.dart';
import 'package:winch_project/screens/company_login/login.dart';
import 'package:winch_project/screens/company_signup/common_photo_register.dart';
import 'package:winch_project/screens/company_signup/cubit.dart';
import 'package:winch_project/screens/company_signup/states.dart';
import 'package:winch_project/screens/company_login/flutter_toast.dart';

class Signup2 extends StatefulWidget {
   Signup2({Key? key}) : super(key: key);

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {


  var com_nameController = TextEditingController();
  var com_numberController = TextEditingController();
  var com_emailController = TextEditingController();
  var com_passwordController = TextEditingController();
  var com_addressController = TextEditingController();

  bool _isObscure = true;
   final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> ComSignupCubit(),
        child: BlocConsumer<ComSignupCubit, ComSignupStates>(
        listener: (context, state) {
      if(state is CreateComSuccessState)
      {

        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return const Home();
            }));

      }

      if(state is ComSignupErrorState)
      {
        return showToast2();

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
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 20, top: 15),
                  child: Row(
                    children: const [
                      Text(
                        "SIGN UP_Winch company",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                            controller: com_nameController,

                            validator: (value){
                              if (value!.isEmpty)
                              {
                                return'please enter your Company Name';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Company Name",
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
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: TextFormField(
                            controller: com_emailController,


                            validator: (value){

                              if (value!.isEmpty)
                              {
                                return'please enter your email';
                              }
                              onChanged: (val){
                                setState(() => com_emailController= val as TextEditingController);
                              };
                            },

                            decoration: InputDecoration(
                                hintText: "E-mail",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Mycolor.teal,
                                ),
                                border: InputBorder.none
                            ),
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
                            controller: com_numberController,

                            validator: (value){
                              if (value!.isEmpty)
                              {
                                return'please enter your Company number';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Company Number",
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
                          decoration:
                          BoxDecoration(border: Border(bottom: BorderSide())),
                          child: TextFormField(
                            controller: com_addressController,

                            validator: (value){
                              if (value!.isEmpty)
                              {
                                return'please enter your Company Address';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Company address",
                                prefixIcon: Icon(
                                  Icons.location_on,
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
                                  bottom: BorderSide(color: Color(0xFF59769E),
                                  )
                              )
                          ),
                          child: TextFormField(
                            controller: com_passwordController,


                            validator: (value){

                              if (value!.isEmpty)
                              {
                                return'please enter your password';
                              }
                              if (value.length < 6)
                              {
                                return'The password you entered is less than 6 characters';
                              }
                              onChanged: (val){
                                setState(() => com_passwordController= val as TextEditingController);
                              };
                            },

                            obscureText: _isObscure,
                            decoration: InputDecoration(
                                hintText: "Password",

                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure ? Icons.visibility_off : Icons.visibility,
                                    color: Mycolor.teal,),
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

                                border: InputBorder.none
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildButton(
                          title: 'Commercial Registration photo ',
                          icon: Icons.image_outlined,
                          prefixIcon: Mycolor.teal,
                          onClicked: () {},
                        ),
                        const SizedBox(height: 10),
                        buildButton(
                          title: 'Tax Card photo ',
                          icon: Icons.image_outlined,
                          prefixIcon: Mycolor.teal,
                          onClicked: () {},
                        ),

                        SizedBox(height: 20),


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
                                    if (formKey.currentState!.validate()){
                                      ComSignupCubit.get(context).ComSignup(
                                        email: com_emailController.text,
                                        name: com_nameController.text,
                                        number: com_numberController.text,
                                        password: com_passwordController.text,
                                        company_address: com_addressController.text,


                                      );
                                    }
                                    //  return Signup2();

                                  },

                                  child: const Text('Sign up',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ))

                              ),
                          fallback:(context)=> CircularProgressIndicator(),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an Account?",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                        return Login();
                                      }));
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: Mycolor.teal,
                                  ),
                                )),
                          ],
                        ),
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
    );//this the widget that contain body and appbar
  }
}
