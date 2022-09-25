
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winch_project/screens/colors.dart';

void showToast() => Fluttertoast.showToast(
      msg: "this email is not found",
      fontSize: 18,
      backgroundColor: Mycolor.red,
      timeInSecForIosWeb: 2,
    );

void showToastWithMsg(String msg) => Fluttertoast.showToast(
      msg: "${msg}",
      fontSize: 18,
      backgroundColor: Mycolor.red,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_LONG,
    );
