import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winch_project/screens/colors.dart';


void showToast()=> Fluttertoast.showToast(
  msg: "this email is not found",
  fontSize: 18,
  backgroundColor: Mycolor.darkblue,
  // AppSettings.openLocationSettings();

);
void showToast2()=> Fluttertoast.showToast(
  msg: "this email already exist",
  fontSize: 18,
  backgroundColor: Mycolor.darkblue,

);