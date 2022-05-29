import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winch_project/screens/colors.dart';


void showToast()=> Fluttertoast.showToast(
  msg: "this email is not found",
  fontSize: 18,
  backgroundColor: Colors.red,
  timeInSecForIosWeb: 2,
  // AppSettings.openLocationSettings();

);

void showToastWithMsg(String msg)=> Fluttertoast.showToast(
  msg: "${msg}",
  fontSize: 18,
  backgroundColor: Colors.red,
  timeInSecForIosWeb: 2,
  toastLength: Toast.LENGTH_LONG,

);