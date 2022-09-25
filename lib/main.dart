import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/Splash_Screen.dart';
import 'package:winch_project/screens/bloc_observer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'rescue',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
        ),
        home: SplashScreen(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}
